	<tr>
		<td>
			<?php echo CHtml::link(CHtml::encode($data->id), array('view', 'id'=>$data->id)); ?>
		</td>
		<td>
			<?php echo CHtml::encode($data->colectas); ?>
		</td>
		<td>
			<?php echo CHtml::encode($data->eventos); ?>
		</td>
		<td>
			<?php echo CHtml::encode($data->rifas); ?>
		</td>
		<td>
			<?php echo CHtml::encode($data->desayunos); ?>
		</td>
		<td>
			<?php echo CHtml::encode($data->conferencias); ?>
		</td>
		<td>
			<?php echo CHtml::encode($data->institucion->nombre); ?>
		</td>
		<?php /*
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