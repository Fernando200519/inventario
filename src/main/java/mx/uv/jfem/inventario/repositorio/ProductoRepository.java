package mx.uv.jfem.inventario.repositorio;

import org.springframework.data.jpa.repository.JpaRepository;

import mx.uv.jfem.inventario.entity.Producto;

public interface ProductoRepository extends JpaRepository<Producto, Long>{
    
}
