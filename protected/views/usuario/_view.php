	<tr>
		<td>
			<?php echo CHtml::link(CHtml::encode($data->id), array('view', 'id'=>$data->id)); ?>
		</td>
		<td>
			<?php echo CHtml::encode($data->usuario); ?>
		</td>
		<td>
			<?php echo CHtml::encode($data->tipousuario->nombre); ?>
		</td>
		<td>
			<?php
			 	if(isset($data->institucion))
					echo CHtml::encode($data->institucion->nombre);
				else
				  	echo CHtml::encode('');
				?>
		</td>
		<td>
			<?php echo CHtml::encode($data->estatus0->nombre); ?>
		</td>
	</tr>