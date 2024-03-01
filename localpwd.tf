resource "random_string" "localpwd" {
  for_each = local.localpwd

  length           = each.value.length
  special          = each.value.special
  min_special      = each.value.min_special
  override_special = each.value.override_special
}