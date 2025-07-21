import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseAdmin } from '@/lib/supabase'

export async function POST(request: NextRequest) {
  try {
    const supabaseAdmin = getSupabaseAdmin()
    
    const { email, password, name } = await request.json()

    if (!email || !password) {
      return NextResponse.json(
        { error: 'Email and password are required' },
        { status: 400 }
      )
    }

    // Create user directly with admin client (bypasses email confirmation)
    const { data, error } = await supabaseAdmin.auth.admin.createUser({
      email,
      password,
      email_confirm: true, // Auto-confirm email
      user_metadata: {
        name: name || '',
      }
    })

    if (error) {
      return NextResponse.json(
        { error: error.message },
        { status: 400 }
      )
    }

    // Add user to our users table
    if (data.user) {
      const { error: dbError } = await supabaseAdmin
        .from('users')
        .insert([
          {
            id: data.user.id,
            name: name || '',
            email: email,
            created_at: new Date().toISOString(),
            updated_at: new Date().toISOString(),
          },
        ])

      if (dbError) {
        console.error('Error inserting user into database:', dbError)
      }
    }

    return NextResponse.json(
      { 
        message: 'User created successfully and confirmed',
        user: data.user
      },
      { status: 201 }
    )
  } catch (error) {
    console.error('Create user error:', error)
    return NextResponse.json(
      { error: 'Internal server error' },
      { status: 500 }
    )
  }
}
