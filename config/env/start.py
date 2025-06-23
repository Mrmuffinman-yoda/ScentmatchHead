# This script will initialise the environment variables for the application.

import string
import secrets

def write_env_file(filename, env_vars):
    with open(filename, "w") as file:
        for key, value in env_vars.items():
            file.write(f"{key}={value}\n")

def generate_key(length=32):
    """Generate a random key of specified length."""
    characters = string.ascii_letters + string.digits
    return ''.join(secrets.choice(characters) for _ in range(length))

def main():
    
    dev_db = generate_key()
    prod_db = generate_key()
    test_db = generate_key()
    dev_env = {
        "DB_HOST": "postgres-db-DEV",
        "DB_PORT": "5432",
        "DB_NAME": "scentmatch_dev_db",
        "DB_USER": "DEV_USER",
        "POSTGRES_USER": "DEV_USER",
        "POSTGRES_PASSWORD": dev_db,
        "POSTGRES_DB": "scentmatch_dev_db",
        "REDIS_HOST": "redis-DEV",
        "REDIS_PORT": "6379",
        "MINIO_ROOT_USER": "minio",
        "MINIO_ROOT_PASSWORD": generate_key(),
        "NODE_ENV": "development",
        "WATCHPACK_POLLING": "true",
        "NEXT_TELEMETRY_DISABLED": "1",
    }
    prod_env = {
        "DATABASE_URL": "postgres://user:password@postgres-db-PRD/scentmatch",
        "DB_HOST": "postgres-db-PRD",
        "DB_PORT": "5432",
        "DB_NAME": "scentmatch_db",
        "DB_USER": "scentmatch_user",
        "POSTGRES_USER": "scentmatch_user",
        "POSTGRES_PASSWORD": prod_db,
        "POSTGRES_DB": "scentmatch_db",
        "REDIS_HOST": "redis",
        "REDIS_PORT": "6379",
        "MINIO_ROOT_USER": "minio",
        "MINIO_ROOT_PASSWORD": generate_key(),
        "NODE_ENV": "production",
        "BASE_URL": "https://scentmatch.harison.cloud",
        "NEXT_TELEMETRY_DISABLED": "1",
    }
    test_env = {
        "DB_HOST": "postgres-db-TST",
        "DB_PORT": "5432",
        "DB_NAME": "scentmatch_tst_db",
        "DB_USER": "TST_USER",
        "POSTGRES_USER": "TST_USER",
        "POSTGRES_PASSWORD": test_db,
        "POSTGRES_DB": "scentmatch_tst_db",
        "REDIS_HOST": "redis-TST",
        "REDIS_PORT": "6379",
        "MINIO_ROOT_USER": "minio",
        "MINIO_ROOT_PASSWORD": generate_key(),
        "NEXT_TELEMETRY_DISABLED": "1",
    }

    write_env_file("config/env/.env.prod", prod_env)
    write_env_file("config/env/.env.test", test_env)
    write_env_file("config/env/.env.dev", dev_env)
    print("All .env files generated successfully.")

if __name__ == "__main__":
    main()