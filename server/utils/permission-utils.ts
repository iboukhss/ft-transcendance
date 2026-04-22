

export function requireAdmin(user:any) {
  if (user.role !== "Admin") {
    throw createError({ statusCode: 403 });
  }
}
