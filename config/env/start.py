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
    dev_env = {
        "DB_HOST": "postgres-db-DEV",
        "DB_PORT": "5432",
        "DB_NAME": "scentmatch_dev_db",
        "DB_USER": "DEV_USER",
        "DB_PASSWORD": generate_key(),
        "REDIS_HOST": "redis-DEV",
        "REDIS_PORT": "6379",
        "MINIO_ROOT_USER": "minio",
        "MINIO_ROOT_PASSWORD": generate_key(),
        "NODE_ENV": "development",
        "WATCHPACK_POLLING": "true"
    }
    prod_env = {
        "DATABASE_URL": "postgres://user:password@postgres-db-PRD/scentmatch",
        "DB_HOST": "postgres-db-PRD",
        "DB_PORT": "5432",
        "DB_NAME": "scentmatch_db",
        "DB_USER": "scentmatch_user",
        "DB_PASSWORD": generate_key(),
        "REDIS_HOST": "redis",
        "REDIS_PORT": "6379",
        "MINIO_ROOT_USER": "minio",
        "MINIO_ROOT_PASSWORD": generate_key(),
        "NODE_ENV": "production"
    }
    test_env = {
        "DB_HOST": "postgres-db-TST",
        "DB_PORT": "5432",
        "DB_NAME": "scentmatch_tst_db",
        "DB_USER": "TST_USER",
        "DB_PASSWORD": generate_key(),
        "REDIS_HOST": "redis-TST",
        "REDIS_PORT": "6379",
        "MINIO_ROOT_USER": "minio",
        "MINIO_ROOT_PASSWORD": generate_key()
    }

    write_env_file("config/env/.env.prod", prod_env)
    write_env_file("config/env/.env.test", test_env)
    write_env_file("config/env/.env.dev", dev_env)
    print("All .env files generated successfully.")

if __name__ == "__main__":
    main()