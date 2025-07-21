'use client'

import { createContext, useContext, useEffect, useState, type ReactNode } from 'react'
import { supabase } from '@/lib/supabase'
import type { User } from '@/types/database'
import type { User as SupabaseUser } from '@supabase/supabase-js'

interface AuthContextType {
  user: User | null
  loading: boolean
  signIn: (email: string, password: string) => Promise<void>
  signUp: (email: string, password: string) => Promise<void>
  signOut: () => Promise<void>
}

const AuthContext = createContext<AuthContextType | undefined>(undefined)

// Helper function to get user data from our database
async function getUserFromSupabase(supabaseUser: SupabaseUser): Promise<User | null> {
  if (!supabase) return null

  try {
    const { data, error } = await supabase
      .from('users')
      .select('*')
      .eq('id', supabaseUser.id)
      .single()

    if (error) {
      console.error('Error fetching user:', error)
      return null
    }

    return data as User
  } catch (err) {
    console.error('Error getting user from database:', err)
    return null
  }
}

export function AuthProvider({ children }: { children: ReactNode }) {
  const [user, setUser] = useState<User | null>(null)
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    // Get initial session
    const getInitialSession = async () => {
      if (!supabase) {
        setLoading(false)
        return
      }

      try {
        const {
          data: { session },
        } = await supabase.auth.getSession()
        setUser(session?.user ? await getUserFromSupabase(session.user) : null)
      } catch (error) {
        console.error('Error getting session:', error)
      } finally {
        setLoading(false)
      }
    }

    getInitialSession()

    // Listen for auth changes
    if (supabase) {
      const {
        data: { subscription },
      } = supabase.auth.onAuthStateChange(async (event, session) => {
        setUser(session?.user ? await getUserFromSupabase(session.user) : null)
        setLoading(false)
      })

      return () => subscription.unsubscribe()
    }
  }, [])

  const signIn = async (email: string, password: string) => {
    if (!supabase) {
      throw new Error('Supabase client not initialized')
    }

    const { error } = await supabase.auth.signInWithPassword({
      email,
      password,
    })

    if (error) throw error
  }

  const signUp = async (email: string, password: string) => {
    if (!supabase) {
      throw new Error('Supabase client not initialized')
    }

    const { error } = await supabase.auth.signUp({
      email,
      password,
    })

    if (error) throw error
  }

  const signOut = async () => {
    if (!supabase) {
      throw new Error('Supabase client not initialized')
    }

    const { error } = await supabase.auth.signOut()
    if (error) throw error
  }

  const value = {
    user,
    loading,
    signIn,
    signUp,
    signOut,
  }

  return <AuthContext.Provider value={value}>{children}</AuthContext.Provider>
}

export function useAuth() {
  const context = useContext(AuthContext)
  if (context === undefined) {
    throw new Error('useAuth must be used within an AuthProvider')
  }
  return context
}
