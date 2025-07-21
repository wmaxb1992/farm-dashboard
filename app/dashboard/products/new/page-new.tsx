'use client'

import Link from 'next/link'
import { ArrowLeft } from 'lucide-react'
import { ProductForm } from '@/components/forms/product-form'

export default function NewProductPage() {
  return (
    <div className="container mx-auto py-8 px-4">
      <div className="mb-6">
        <Link
          href="/dashboard/products"
          className="inline-flex items-center text-sm text-gray-600 hover:text-gray-900"
        >
          <ArrowLeft className="h-4 w-4 mr-2" />
          Back to Products
        </Link>
      </div>
      <ProductForm />
    </div>
  )
}
