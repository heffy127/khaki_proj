<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script type="text/javascript">
  	$(function() {
			$(".hb_table_content_tr").click(function(){
			$(".handler_detail").children().remove();
			// ������ȣ�� ���� ����� ������ �̹��� db���� ajax�� �����;���
			var carNum = $(this).children(".hb_table_content_carNum").text(); // ������ȣ
			var carModel = $(this).children(".hb_table_content_carModel").text(); // ��������
			var startLocation = $(this).children(".hb_table_content_startLocation").text(); // ������(����������ġ)
			var arrivalLocation = $(this).children(".hb_table_content_arrivalLocation").text(); // �������(����������ġ)
			var transportCompletionTime = $(this).children(".hb_table_content_transportCompletionTime").text(); // ��ۿϷ�ð�
			var expectedPoint = $(this).children(".hb_table_content_expectedPoint").text(); // ������������Ʈ
			
			var h_detail_img = "<div class=\"h_detail_img\">"; // �̹��� div�±�
			var h_detail_image = "<img class=\"h_detail_image\" src=\"https://img.hankyung.com/photo/201903/AA.19251102.1.jpg\"></img>"; // ������ȣ�� db�� �����Ͽ� ������ ������ �̹��� �±�(���÷� src�� �ӽ� �̹��� ������)
			var h_detail_carNum = "</div><div class=\"h_detail_carNum_title\">������ȣ</div><div class=\"h_detail_carModel_title\">����</div><div class=\"h_detail_carNum\">"; // ������ȣ div�±�
			var h_detail_carModel = "</div><div class=\"h_detail_carModel\">"; // ���� div�±�
			var h_detail_startLocation = "</div><div class=\"h_detail_startLocation_title\">������</div><div class=\"h_detail_startLocation\">"; // ������(����������ġ) div �±�
			var h_detail_arrivallocation = "</div><div class=\"h_detail_arrivallocation_title\">�������</div><div class=\"h_detail_arrivallocation\">"; // �������(����������ġ) div �±�
			var h_detail_transportCompletionTime = "</div><div class=\"h_detail_transportCompletionTime_title\">��ۿϷ�ð�</div><div class=\"h_detail_transportCompletionTime\">"; // ��� �Ϸ� �ð� div �±�
			var h_detail_expectedPoint = "</div><div class=\"h_detail_expectedPoint_title\">������������Ʈ</div><div class=\"h_detail_expectedPoint\">";
			
			$(".handler_detail").append(h_detail_img + h_detail_image + h_detail_carNum + carNum + h_detail_carModel + carModel + h_detail_startLocation + startLocation + h_detail_arrivallocation + arrivalLocation + h_detail_transportCompletionTime + transportCompletionTime + h_detail_expectedPoint + expectedPoint + "</div>");
			/* $(".hb_table_content_tr").attr("data-toggle", "modal");
			$(".hb_table_content_tr").attr("data-target", "#exampleModal2"); */
		})
  	})
  </script>