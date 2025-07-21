'use client'

import type React from 'react'

import { useState } from 'react'
import Link from 'next/link'
import { usePathname, useRouter } from 'next/navigation'
import { Button } from '@/components/ui/button'
import { Sheet, SheetContent, SheetTrigger } from '@/components/ui/sheet'
import { useAuth } from '@/lib/auth/context'
import {
  Home,
  Package,
  ShoppingCart,
  Users,
  Settings,
  Menu,
  Leaf,
  LogOut,
  Bell,
  Package2,
  Sprout,
  DollarSign,
} from 'lucide-react'
import { cn } from '@/lib/utils'

const navigation = [
  { name: 'Dashboard', href: '/dashboard', icon: Home },
  { name: 'Plantings', href: '/dashboard/plantings', icon: Sprout },
  { name: 'Harvests', href: '/dashboard/harvests', icon: Package2 },
  { name: 'Batches', href: '/dashboard/batches', icon: Package },
  { name: 'Pricing', href: '/dashboard/pricing', icon: DollarSign },
  { name: 'Products', href: '/dashboard/products', icon: Package },
  { name: 'Orders', href: '/dashboard/orders', icon: ShoppingCart },
  { name: 'Profile', href: '/dashboard/profile', icon: Settings },
]

export default function DashboardLayout({ children }: { children: React.ReactNode }) {
  const pathname = usePathname()
  const router = useRouter()
  const { signOut } = useAuth()
  const [sidebarOpen, setSidebarOpen] = useState(false)

  const handleSignOut = async () => {
    try {
      await signOut()
      router.push('/auth/login')
    } catch (error) {
      console.error('Sign out error:', error)
    }
  }

  const Sidebar = ({ mobile = false }) => (
    <div className={cn('flex flex-col h-full', mobile ? 'w-full' : 'w-64')}>
      <div className="flex items-center gap-2 p-6 border-b">
        <div className="bg-green-600 p-2 rounded-lg">
          <Leaf className="h-6 w-6 text-white" />
        </div>
        <div>
          <h2 className="font-bold text-lg">Green Valley Farm</h2>
          <p className="text-sm text-gray-500">Farm Dashboard</p>
        </div>
      </div>

      <nav className="flex-1 p-4">
        <ul className="space-y-2">
          {navigation.map(item => {
            const isActive = pathname === item.href
            return (
              <li key={item.name}>
                <Link
                  href={item.href}
                  className={cn(
                    'flex items-center gap-3 px-3 py-2 rounded-lg text-sm font-medium transition-colors',
                    isActive
                      ? 'bg-green-100 text-green-700'
                      : 'text-gray-600 hover:bg-gray-100 hover:text-gray-900'
                  )}
                  onClick={() => mobile && setSidebarOpen(false)}
                >
                  <item.icon className="h-5 w-5" />
                  {item.name}
                </Link>
              </li>
            )
          })}
        </ul>
      </nav>

      <div className="p-4 border-t">
        <Button
          variant="ghost"
          className="w-full justify-start gap-3 text-red-600 hover:text-red-700 hover:bg-red-50"
          onClick={handleSignOut}
        >
          <LogOut className="h-5 w-5" />
          Sign Out
        </Button>
      </div>
    </div>
  )

  return (
    <div className="min-h-screen bg-gray-50">
      {/* Desktop Sidebar */}
      <div className="hidden lg:fixed lg:inset-y-0 lg:flex lg:w-64 lg:flex-col">
        <div className="flex flex-col flex-grow bg-white border-r border-gray-200 overflow-y-auto">
          <Sidebar />
        </div>
      </div>

      {/* Mobile Sidebar */}
      <Sheet open={sidebarOpen} onOpenChange={setSidebarOpen}>
        <SheetContent side="left" className="p-0 w-64">
          <Sidebar mobile />
        </SheetContent>
      </Sheet>

      {/* Main Content */}
      <div className="lg:pl-64">
        {/* Top Navigation */}
        <div className="sticky top-0 z-40 flex h-16 shrink-0 items-center gap-x-4 border-b border-gray-200 bg-white px-4 shadow-sm sm:gap-x-6 sm:px-6 lg:px-8">
          <Sheet>
            <SheetTrigger asChild>
              <Button variant="ghost" size="icon" className="lg:hidden">
                <Menu className="h-6 w-6" />
                <span className="sr-only">Open sidebar</span>
              </Button>
            </SheetTrigger>
            <SheetContent side="left" className="p-0 w-64">
              <Sidebar mobile />
            </SheetContent>
          </Sheet>

          <div className="flex flex-1 gap-x-4 self-stretch lg:gap-x-6">
            <div className="flex flex-1"></div>
            <div className="flex items-center gap-x-4 lg:gap-x-6">
              <Button variant="ghost" size="icon">
                <Bell className="h-5 w-5" />
                <span className="sr-only">View notifications</span>
              </Button>

              <div className="hidden lg:block lg:h-6 lg:w-px lg:bg-gray-200" />

              <div className="flex items-center gap-x-2">
                <div className="h-8 w-8 rounded-full bg-green-600 flex items-center justify-center">
                  <span className="text-sm font-medium text-white">JD</span>
                </div>
                <span className="hidden lg:block text-sm font-medium">John Doe</span>
              </div>
            </div>
          </div>
        </div>

        {/* Page Content */}
        <main className="py-8">
          <div className="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">{children}</div>
        </main>
      </div>
    </div>
  )
}
