import fs from 'fs'

import { pool } from '../helper.js'

const execMigrations = async () => {
    const client = await pool.connect()
    try {
        const filePath = './01-init.sql'
        const script = fs.readFileSync(filePath)
        await client.query(script)
        console.log('Migrations executed successfully!')
    } catch (error) {
        console.error('Error executing migrations:', error)
    } finally {
        client.release()
    }
}

execMigrations()
