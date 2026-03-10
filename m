Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460B02E4247;
	Tue, 10 Mar 2026 12:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773144887; cv=none; b=IT4xKE2wYLAWMvW7mktsw2/2hk95GepxDOhWjn/5Zl9KsYFdbHZggnuS5Syhvy+40EJJYyWkfbLPmbSJgn0IUXGIsnh4C6WlQMgwFxNJRbf2BvEGO9paehyoJ8ob4ZMPl74ENPZP8vtTscXJzzsxBXMtIoNHetWiq4bTaddrQEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773144887; c=relaxed/simple;
	bh=WZY+j1jOb/5oJkinzjGlrNxJ6DE0PFQD1A3B5nyl/cc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=FU3WfxxxvlIVHgwDwbfNRs+Jx8ZBgxIVvXmSBUti8d2q3KMuOVkyZmE8rsy10+XeTghU7N+z+NsVLYfeb+PWNjB3lGswexCD7ELsZPcWc7ZNqvXx5HXHv3GBzZNiurSPw+hLVpL0+9uDswaMwrHgjbDQKleYpwxqLAEocfzTCw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=QjPhFCY2; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="QjPhFCY2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7vXaR7uNjklQTsIlRNbN7RCGE3kyI898X5XIJemwXfs=;
  b=QjPhFCY2QGge6Gosyt5kqktyaNrjuHgjmDm1TN1zJPN0TZHP+G5/HzzP
   TKBqfMj6tTxPbzHEKZNMRt6e35rYVaHZVo0QkfRsEF7SfT6buTv2D40U7
   TSurpJ8fUQtJZWLm3eLKdO2VPkiVX2RDXz2ZSZbyBVVo84xdDcxlkbcFz
   8=;
X-CSE-ConnectionGUID: 7OwTvUtiSt6bkwfaOoJLlQ==
X-CSE-MsgGUID: 9zMvVuVUQ568qahYH4tQ+Q==
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=Julia.Lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.23,112,1770591600"; 
   d="scan'208";a="267084166"
Received: from i80.paris.inria.fr (HELO i80.paris.inria.fr.) ([128.93.102.196])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 13:14:37 +0100
From: Julia Lawall <Julia.Lawall@inria.fr>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	workflows@vger.kernel.org,
	cocci@inria.fr,
	Nicolas Palix <nicolas.palix@imag.fr>,
	Hu Haowen <2023002089@link.tyut.edu.cn>,
	Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Federico Vaga <federico.vaga@vaga.pv.it>,
	Carlos Bilbao <carlos.bilbao@kernel.org>,
	Avadhut Naik <avadhut.naik@amd.com>,
	LIU Haoyang <tttturtleruss@gmail.com>
Subject: [PATCH v2] coccinelle: update Coccinelle URL
Date: Tue, 10 Mar 2026 13:14:31 +0100
Message-Id: <20260310121431.362091-1-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The LIP6 URL no longer functions.

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---

v2: corrected the character encoding, no other changes

 Documentation/dev-tools/coccinelle.rst                |    2 +-
 Documentation/translations/it_IT/process/4.Coding.rst |    3 ++-
 Documentation/translations/sp_SP/process/4.Coding.rst |    3 ++-
 Documentation/translations/zh_CN/process/4.Coding.rst |    2 +-
 Documentation/translations/zh_TW/process/4.Coding.rst |    2 +-
 5 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/Documentation/translations/zh_CN/process/4.Coding.rst b/Documentation/translations/zh_CN/process/4.Coding.rst
index 4cc35d410dbc..a00ad5d6b81e 100644
--- a/Documentation/translations/zh_CN/process/4.Coding.rst
+++ b/Documentation/translations/zh_CN/process/4.Coding.rst
@@ -216,7 +216,7 @@ Documentation/fault-injection/fault-injection.rst。
 可以在 https://sparse.wiki.kernel.org/index.php/Main_page 找到）,
 然后可以通过在make命令中添加“C=1”在代码上运行它。
 
-“Coccinelle”工具 :ref:`http://coccinelle.lip6.fr/ <devtools_coccinelle>`
+“Coccinelle”工具 :ref:`https://coccinelle.gitlabpages.inria.fr/website/ <devtools_coccinelle>`
 能够发现各种潜在的编码问题；它还可以为这些问题提出修复方案。在
 scripts/coccinelle目录下已经打包了相当多的内核“语义补丁”；运行
 “make coccicheck”将运行这些语义补丁并报告发现的任何问题。有关详细信息，请参阅
diff --git a/Documentation/translations/zh_TW/process/4.Coding.rst b/Documentation/translations/zh_TW/process/4.Coding.rst
index e90a6b51fb98..233e8718ed41 100644
--- a/Documentation/translations/zh_TW/process/4.Coding.rst
+++ b/Documentation/translations/zh_TW/process/4.Coding.rst
@@ -219,7 +219,7 @@ Documentation/fault-injection/fault-injection.rst。
 可以在 https://sparse.wiki.kernel.org/index.php/Main_page 找到）,
 然後可以通過在make命令中添加“C=1”在代碼上運行它。
 
-“Coccinelle”工具 :ref:`http://coccinelle.lip6.fr/ <devtools_coccinelle>`
+“Coccinelle”工具 :ref:`https://coccinelle.gitlabpages.inria.fr/website/ <devtools_coccinelle>`
 能夠發現各種潛在的編碼問題；它還可以爲這些問題提出修復方案。在
 scripts/coccinelle目錄下已經打包了相當多的內核“語義補丁”；運行
 “make coccicheck”將運行這些語義補丁並報告發現的任何問題。有關詳細信息，請參閱
diff --git a/Documentation/translations/it_IT/process/4.Coding.rst b/Documentation/translations/it_IT/process/4.Coding.rst
index 3126342c4b4a..a2ec35e016b7 100644
--- a/Documentation/translations/it_IT/process/4.Coding.rst
+++ b/Documentation/translations/it_IT/process/4.Coding.rst
@@ -329,7 +329,8 @@ Sparse deve essere installato separatamente (se il vostra distribuzione non
 lo prevede, potete trovarlo su https://sparse.wiki.kernel.org/index.php/Main_Page);
 può essere attivato sul codice aggiungendo "C=1" al comando make.
 
-Lo strumento "Coccinelle" (http://coccinelle.lip6.fr/) è in grado di trovare
+Lo strumento "Coccinelle" (https://coccinelle.gitlabpages.inria.fr/website/)
+è in grado di trovare
 una vasta varietà di potenziali problemi di codifica; e può inoltre proporre
 soluzioni per risolverli.  Un buon numero di "patch semantiche" per il kernel
 sono state preparate nella cartella scripts/coccinelle; utilizzando
diff --git a/Documentation/dev-tools/coccinelle.rst b/Documentation/dev-tools/coccinelle.rst
index c714780d458a..05614c469b47 100644
--- a/Documentation/dev-tools/coccinelle.rst
+++ b/Documentation/dev-tools/coccinelle.rst
@@ -34,7 +34,7 @@ of many distributions, e.g. :
 
 Some distribution packages are obsolete and it is recommended
 to use the latest version released from the Coccinelle homepage at
-http://coccinelle.lip6.fr/
+https://coccinelle.gitlabpages.inria.fr/website
 
 Or from Github at:
 
diff --git a/Documentation/translations/sp_SP/process/4.Coding.rst b/Documentation/translations/sp_SP/process/4.Coding.rst
index 7cc347c34354..6c3750ccdea2 100644
--- a/Documentation/translations/sp_SP/process/4.Coding.rst
+++ b/Documentation/translations/sp_SP/process/4.Coding.rst
@@ -336,7 +336,8 @@ https://sparse.wiki.kernel.org/index.php/Main_Page si su distribución no lo
 empaqueta); luego, puede ejecutarse en el código agregando "C=1" a su
 comando make.
 
-La herramienta "Coccinelle" (http://coccinelle.lip6.fr/) puede encontrar
+La herramienta "Coccinelle" (https://coccinelle.gitlabpages.inria.fr/website/)
+puede encontrar
 una amplia variedad de posibles problemas de codificación; también puede
 proponer correcciones para esos problemas. Bastantes "parches semánticos"
 para el kernel se han empaquetado en el directorio scripts/coccinelle;

