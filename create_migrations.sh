#!/bin/bash

# Script para crear todas las migraciones de Laravel
# Guardar como: create_migrations.sh
# Ejecutar: chmod +x create_migrations.sh && ./create_migrations.sh

echo "🚀 Creando migraciones para Laravel..."
echo "================================"

# 1. Tabla area (primera por ser referenciada)
echo "📦 Creando migración para area..."
php artisan make:migration create_area_table
echo "✅ Migración area creada"
echo "-------------------------------"

# 2. Tabla tipos_equipos
echo "📦 Creando migración para tipos_equipos..."
php artisan make:migration create_tipos_equipos_table
echo "✅ Migración tipos_equipos creada"
echo "-------------------------------"

# 3. Tabla frecuencias
echo "📦 Creando migración para frecuencias..."
php artisan make:migration create_frecuencias_table
echo "✅ Migración frecuencias creada"
echo "-------------------------------"

# 4. Tabla estados
echo "📦 Creando migración para estados..."
php artisan make:migration create_estados_table
echo "✅ Migración estados creada"
echo "-------------------------------"

# 5. Tabla tipo_solicitudes
echo "📦 Creando migración para tipo_solicitudes..."
php artisan make:migration create_tipo_solicitudes_table
echo "✅ Migración tipo_solicitudes creada"
echo "-------------------------------"

# 6. Tabla localizaciones (depende de area)
echo "📦 Creando migración para localizaciones..."
php artisan make:migration create_localizaciones_table
echo "✅ Migración localizaciones creada"
echo "-------------------------------"

# 7. Tabla equipos_mant (depende de tipos_equipos, area, localizaciones)
echo "📦 Creando migración para equipos_mant..."
php artisan make:migration create_equipos_mant_table
echo "✅ Migración equipos_mant creada"
echo "-------------------------------"

# 8. Tabla personas (depende de area y users)
echo "📦 Creando migración para personas..."
php artisan make:migration create_personas_table
echo "✅ Migración personas creada"
echo "-------------------------------"

# 9. Tabla mantenimientos_programados corregida (depende de frecuencias y equipos_mant)
echo "📦 Creando migración para mantenimientos_programados (corregida)..."
php artisan make:migration update_mantenimientos_programados_table --table=mantenimientos_programados
echo "✅ Migración mantenimientos_programados creada"
echo "-------------------------------"

# 10. Instalar Spatie Permission
echo "📦 Instalando spatie/laravel-permission..."
composer require spatie/laravel-permission
echo "✅ Paquete instalado"
echo "-------------------------------"

# 11. Publicar migración de Spatie
echo "📦 Publicando migración de Spatie Permission..."
php artisan vendor:publish --provider="Spatie\Permission\PermissionServiceProvider"
echo "✅ Migración de permisos publicada"
echo "-------------------------------"

echo "================================"
echo "🎉 TODAS LAS MIGRACIONES CREADAS!"
echo ""
echo "📁 Las migraciones se encuentran en: database/migrations/"
echo ""
echo "👉 PRÓXIMOS PASOS:"
echo "1. Editar cada archivo de migración con la estructura correspondiente"
echo "2. Decidir si hacer rollback o mantener datos existentes"
echo "3. Ejecutar: php artisan migrate"
echo "4. Crear seeders para los datos"
echo "================================"