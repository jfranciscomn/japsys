	<tr>
		<td>
			<?php echo CHtml::link(CHtml::encode($data->id), array('view', 'id'=>$data->id)); ?>
		</td>
		<td>
			<?php echo CHtml::encode($data->personaFisica); ?>
		</td>
		<td>
			<?php echo CHtml::encode($data->personaMoral); ?>
		</td>
		<td>
			<?php echo CHtml::encode($data->fundacionesNacionales); ?>
		</td>
		<td>
			<?php echo CHtml::encode($data->fundacionesExtrajeras); ?>
		</td>
		<td>
			<?php echo CHtml::encode($data->fondosGubernamentales); ?>
		</td>
		<td>
			<?php echo CHtml::encode($data->especie); ?>
		</td>
		<?php /*
		<td>
			<?php echo CHtml::encode($data->institucion->nombre); ?>
		</td>
		<td>
			<?php echo CHtml::encode($data->ejercicioFiscal->nombre); ?>
		</td>
		<td>
			<?php echo CHtml::encode($data->estatus->nombre); ?>
		</td>
		<td>
			<?php echo CHtml::encode($data->editable); ?>
		</td>
		<td>
			<?php echo CHtml::encode($data->ultimaModificacion_dt); ?>
		</td>
		*/ ?>
	</tr>