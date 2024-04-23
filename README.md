It's a Ecommerce-admin Copy

### Setup .env file


```js
NEXT_PUBLIC_CLERK_PUBLISHABLE_KEY=
CLERK_SECRET_KEY=
NEXT_PUBLIC_CLERK_SIGN_IN_URL=/sign-in
NEXT_PUBLIC_CLERK_SIGN_UP_URL=/sign-up
NEXT_PUBLIC_CLERK_AFTER_SIGN_IN_URL=/
NEXT_PUBLIC_CLERK_AFTER_SIGN_UP_URL=/

# This was inserted by `prisma init`:
# Environment variables declared in this file are automatically made available to Prisma.
# See the documentation for more detail: https://pris.ly/d/prisma-schema#accessing-environment-variables-from-the-schema

# Prisma supports the native connection string format for PostgreSQL, MySQL, SQLite, SQL Server, MongoDB and CockroachDB.
# See the documentation for all the connection string options: https://pris.ly/d/connection-strings
# See the documentation for MySql: https://www.prisma.io/docs/orm/overview/databases/mysql
# See the documentation for SqlServer https://www.prisma.io/docs/orm/overview/databases/sql-server/sql-server-local

DATABASE_URL=''
NEXT_PUBLIC_CLOUDINARY_CLOUD_NAME=""
STRIPE_API_KEY=
FRONTEND_STORE_URL=http://localhost:3001
STRIPE_WEBHOOK_SECRET=
```


### Connect to DB and Push Prisma 
```shell
npx prisma generate or npx prisma generate ./prisma/schema.prisma 
npx prisma db push
```
### Connect to Cloudinary
[Cloudinary](https://cloudinary.com/)
Create a free account
in the .env assign the corresponding cloud name
```shell
NEXT_PUBLIC_CLOUDINARY_CLOUD_NAME=""
```
then go to settings --> Upload --> Upload presets --> Add upload presets --> Signing mode change to Unsigned --> Save

Copy the upload preset name and paste it into:
```js
const ImageUpload: React.FC<ImageUploadProps> = ({
...
<CldUploadWidget onUpload={onUpload} uploadPreset="{your_upload_preset_Unsigned}">
...
}

```

### Start the app

```shell
npm run dev
```

