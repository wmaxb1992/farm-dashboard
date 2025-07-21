import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseAdmin } from '@/lib/supabase'

export async function POST(request: NextRequest) {
  try {
    const supabaseAdmin = getSupabaseAdmin()
    
    const { email } = await request.json()

    if (!email) {
      return NextResponse.json(
        { error: 'Email is required' },
        { status: 400 }
      )
    }

    // Confirm the user using admin client
    const { data, error } = await supabaseAdmin.auth.admin.updateUserById(
      '', // We need to get the user ID first
      { email_confirm: true }
    )

    // Alternative: Get user by email and confirm
    const { data: users, error: getUserError } = await supabaseAdmin.auth.admin.listUsers()
    
    if (getUserError) {
      return NextResponse.json(
        { error: getUserError.message },
        { status: 400 }
      )
    }

    const user = users.users.find(u => u.email === email)
    
    if (!user) {
      return NextResponse.json(
        { error: 'User not found' },
        { status: 404 }
      )
    }

    // Confirm the user
    const { error: confirmError } = await supabaseAdmin.auth.admin.updateUserById(
      user.id,
      { email_confirm: true }
    )

    if (confirmError) {
      return NextResponse.json(
        { error: confirmError.message },
        { status: 400 }
      )
    }

    return NextResponse.json(
      { message: 'User confirmed successfully' },
      { status: 200 }
    )
  } catch (error) {
    console.error('Confirm user error:', error)
    return NextResponse.json(
      { error: 'Internal server error' },
      { status: 500 }
    )
  }
}
