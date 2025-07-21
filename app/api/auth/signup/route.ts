import { NextRequest, NextResponse } from 'next/server'
import { supabase } from '@/lib/supabase'

export async function POST(request: NextRequest) {
  try {
    if (!supabase) {
      return NextResponse.json(
        { error: 'Supabase client not initialized' },
        { status: 500 }
      )
    }

    const { email, password, name } = await request.json()

    if (!email || !password) {
      return NextResponse.json(
        { error: 'Email and password are required' },
        { status: 400 }
      )
    }

    // Create user in Supabase Auth
    const { data: authData, error: authError } = await supabase.auth.signUp({
      email,
      password,
    })

    if (authError) {
      return NextResponse.json(
        { error: authError.message },
        { status: 400 }
      )
    }

    // If user was created successfully, add them to our users table
    if (authData.user) {
      const { error: dbError } = await supabase
        .from('users')
        .insert([
          {
            id: authData.user.id,
            name: name || '',
            email: email,
            created_at: new Date().toISOString(),
            updated_at: new Date().toISOString(),
          },
        ])

      if (dbError) {
        console.error('Error inserting user into database:', dbError)
        // Don't return error here as the auth user was created successfully
      }
    }

    return NextResponse.json(
      { 
        message: 'User created successfully',
        user: authData.user,
        session: authData.session
      },
      { status: 201 }
    )
  } catch (error) {
    console.error('Signup error:', error)
    return NextResponse.json(
      { error: 'Internal server error' },
      { status: 500 }
    )
  }
}
