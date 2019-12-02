import com.pucmm.CustomUserDetailsService
//import com.pucmm.UserPasswordEncoderListener

// Place your Spring DSL code here

beans = {
    userPasswordEncoderListener(UserPasswordEncoderListener)
    userDetailsService(CustomUserDetailsService)
}