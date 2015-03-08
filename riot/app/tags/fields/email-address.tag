<email-address>
  <div show={ editMode == true }>
    <input type="text" name="email" class="form-control" value="{ email }">
  </div>

  <div show="{ editMode == false }">
    { email}
  </div>
</email-address>
