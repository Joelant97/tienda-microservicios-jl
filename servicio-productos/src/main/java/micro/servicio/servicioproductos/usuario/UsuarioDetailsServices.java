package micro.servicio.servicioproductos.usuario;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

@Service
public class UsuarioDetailsServices implements UserDetailsService {

    @Autowired
    private RestTemplate restTemplate;
    private HttpHeaders headers;
    private String host = "http://localhost:8080/";
    @Value("${usuarioToken}")
    private String usuarioToken;

    @Autowired
    UsuarioRepository usuarioRepository;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

        String url = host+"servicio-usuarios/usuario/"+username;

        headers = new HttpHeaders();
        headers.set("Authorization", "Bearer "+usuarioToken);
        HttpEntity<Usuario> requestEntity = new HttpEntity<>(null, headers);
        ResponseEntity<Usuario> result = restTemplate.postForEntity(url, requestEntity, Usuario.class);
        Usuario usuario = result.getBody();
       // Usuario usuario = usuarioRepository.findByUsername(username);

        if(usuario == null){
            throw new UsernameNotFoundException("Usuario No encontrado: " + username);
        }
        return new UsuarioDetails(usuario);
    }
}
