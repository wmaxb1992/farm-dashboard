import Link from 'next/link'
import { Button } from '@/components/ui/button'
import { Card, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { Users, ShoppingCart, TrendingUp } from 'lucide-react'

export default function HomePage() {
  return (
    <div className="min-h-screen bg-gradient-to-br from-green-50 to-emerald-100">
      <div className="container mx-auto px-4 py-16">
        <div className="text-center mb-16">
          <h1 className="text-4xl font-bold text-gray-900 mb-4">Radish Farm Dashboard</h1>
          <p className="text-xl text-gray-600 mb-8 max-w-2xl mx-auto">
            Manage your farm, showcase your fresh produce, and connect directly with customers who
            value quality and freshness.
          </p>
          <div className="flex gap-4 justify-center">
            <Link href="/auth/signup">
              <Button size="lg" className="bg-green-600 hover:bg-green-700">
                Get Started
              </Button>
            </Link>
            <Link href="/auth/login">
              <Button size="lg" variant="outline">
                Sign In
              </Button>
            </Link>
          </div>
        </div>

        <div className="grid md:grid-cols-3 gap-8 mb-16">
          <Card>
            <CardHeader className="text-center">
              <div className="bg-blue-100 p-3 rounded-full w-fit mx-auto mb-4">
                <ShoppingCart className="h-8 w-8 text-blue-600" />
              </div>
              <CardTitle>Manage Products</CardTitle>
              <CardDescription>
                Add and manage your fresh produce with detailed descriptions, pricing, and
                availability
              </CardDescription>
            </CardHeader>
          </Card>

          <Card>
            <CardHeader className="text-center">
              <div className="bg-purple-100 p-3 rounded-full w-fit mx-auto mb-4">
                <Users className="h-8 w-8 text-purple-600" />
              </div>
              <CardTitle>Connect with Customers</CardTitle>
              <CardDescription>
                Build relationships with customers who appreciate locally grown, fresh produce
              </CardDescription>
            </CardHeader>
          </Card>

          <Card>
            <CardHeader className="text-center">
              <div className="bg-orange-100 p-3 rounded-full w-fit mx-auto mb-4">
                <TrendingUp className="h-8 w-8 text-orange-600" />
              </div>
              <CardTitle>Track Performance</CardTitle>
              <CardDescription>
                Monitor your sales, track orders, and grow your farm business with detailed
                analytics
              </CardDescription>
            </CardHeader>
          </Card>
        </div>

        <div className="bg-white rounded-lg shadow-lg p-8 text-center">
          <h2 className="text-2xl font-bold text-gray-900 mb-4">Join the Fresh Food Revolution</h2>
          <p className="text-gray-600 mb-6">
            Connect your farm directly to customers who value fresh, local produce. Start selling
            today and grow your business with our easy-to-use platform.
          </p>
          <Link href="/auth/signup">
            <Button size="lg" className="bg-green-600 hover:bg-green-700">
              Start Your Farm Journey
            </Button>
          </Link>
        </div>
      </div>
    </div>
  )
}
