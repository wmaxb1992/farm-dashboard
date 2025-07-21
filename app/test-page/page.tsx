'use client'

import { useState } from 'react'

export default function TestPage() {
  console.log('TestPage rendering...')
  const [test, setTest] = useState('Hello')

  return (
    <div className="p-8">
      <h1>Test Page</h1>
      <p>This is a simple test: {test}</p>
      <button
        onClick={() => setTest('Updated!')}
        className="bg-blue-500 text-white px-4 py-2 rounded"
      >
        Click me
      </button>
    </div>
  )
}
