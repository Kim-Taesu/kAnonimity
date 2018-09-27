<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="anonymity.*"%>
<%@ page import="java.util.HashMap"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Resume - Start Bootstrap Theme</title>

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom fonts for this template -->
<link
	href="https://fonts.googleapis.com/css?family=Saira+Extra+Condensed:500,700"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Muli:400,400i,800,800i"
	rel="stylesheet">
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/resume.min.css" rel="stylesheet">
</head>
<body>
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}

		System.out.println("!!!Example Page!!!");

		String taxonomy = request.getParameter("taxonomy");
		String selectHeader = request.getParameter("selectHeader");
		String inputDataRealPath = request.getParameter("inputDataRealPath");
		String inputDataName = request.getParameter("inputDataName");

		long start = System.currentTimeMillis();

		//kAnonymity(String Taxonomy, String header, int Kvalue, String dataFilePath)
		kAnonymity2 mykAnonymity = new kAnonymity2(taxonomy, selectHeader, inputDataRealPath);
		String result = mykAnonymity.run();

		result.replaceAll(", ", "\n");
		System.out.println("!!!" + result);
		//HashMap<String, Integer> equivalent = new HashMap<String, Integer>();

		HashMap<String, Integer> equivalent = mykAnonymity.equivalent();
		long end = System.currentTimeMillis();
	%>

	<nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top"
		id="sideNav">
		<a class="navbar-brand js-scroll-trigger" href="#page-top"> <span
			class="d-block d-lg-none">Data Privacy Project</span> <span
			class="d-none d-lg-block"> <!-- <img class="img-fluid img-profile rounded-circle mx-auto mb-2" src="img/profile.jpg" alt=""> -->
		</span>
		</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link js-scroll-trigger">Start</a></li>
				<li class="nav-item"><a class="nav-link js-scroll-trigger">Data Input</a></li>
				<li class="nav-item"><a class="nav-link js-scroll-trigger">Quasi-Identifier</a></li>
				<li class="nav-item"><a class="nav-link js-scroll-trigger">Taxonomy tree</a></li>
				<li class="nav-item active"><a class="nav-link js-scroll-trigger">Example</a></li>
				<li class="nav-item"><a class="nav-link js-scroll-trigger">Review</a></li>
				<li class="nav-item"><a class="nav-link js-scroll-trigger">Submit &amp; Download</a>
			</ul>
		</div>
	</nav>

	<hr class="m-0">

	<section class="resume-section p-3 p-lg-5 d-flex flex-column"
		id="Example">
		<div class="my-auto">
			<h1>Example</h1>
			<div class="subheading mb-1">
				Time to Anonymize Sample data (1000 line)<br>
				<%=(end - start) / 1000.0 + " sec"%>
			</div>
			<div class="row">
				<div class="col-xs-12 col-md-6">
					<h2>Sampling Data</h2>
					<div class="row-xs-12 row-md-6">
						<textarea id="inputbox" cols="70" rows="9"><%=result%></textarea>
						<br> <br>
					</div>
					<h2>Sample Data's <br>Equivalent Class</h2>
					<div class="row-xs-6 row-md-6">
						<textarea id="inputbox" cols="70" rows="9"><%=equivalent%></textarea>
					</div>
				</div>

				<div class="col-xs-12 col-md-6">
					<h2>What is Equivalent Class?</h2>
					<div class="row-xs-12 row-md-6">
						<textarea id="inputbox" cols="80" rows="9">
	Congruence is an example of an equivalence relation. The leftmost two triangles are congruent, while the third and fourth triangles are not congruent to any other triangle shown here. Thus, the first two triangles are in the same equivalence class, while the third and fourth triangles are each in their own equivalence class.
	In mathematics, when the elements of some set S have a notion of equivalence (formalized as an equivalence relation) defined on them, then one may naturally split the set S into equivalence classes. These equivalence classes are constructed so that elements a and b belong to the same equivalence class if and only if a and b are equivalent.
	
	Formally, given a set S and an equivalence relation ~ on S, the equivalence class of an element a in S is the set</textarea>
						<br> <br>
					</div>
					<h2>Enter the value of k. (Equivalent Class's num)</h2>
					<div class="row-xs-6 row-md-6">
						<form method="post" action="reviewPage.jsp">
							<label for="name">k Value :</label> <input type="text"
								id="kValue" name="kValue" /> <input type="hidden"
								value="<%=taxonomy%>" name="taxonomy" /> <input type="hidden"
								value="<%=inputDataRealPath%>" name="inputDataRealPath" /> <input
								type="hidden" value="<%=inputDataName%>" name="inputDataName" />
							<input type="hidden" value="<%=selectHeader%>"
								name="selectHeader" />
							<button type="submit" class="btn btn-primary pull-right">Next</button>
						</form>
					</div>
				</div>
			</div>
		</div>



	</section>


</body>
</html>