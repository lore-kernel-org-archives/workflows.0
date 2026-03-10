Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C538C3E5EF6;
	Tue, 10 Mar 2026 08:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773130349; cv=none; b=a9Kq2BMhUcUTe7PC8/WOzja/jIjM1ERULNguKbxiCnlnLYE6VhuQKB0Yk0szjwyTcYFPrJTdvoSdPR3Mc4j9Nid8nE1aoD/XWxEzlH2xmsBMtYvB1WkH9RFBhBYR87GjmjhFid+CzTq66rz4xFmgUE60xA3MH+Vs2TYG8PenrZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773130349; c=relaxed/simple;
	bh=aSy8Em961NCZRux0VbAasFzfHnw9T/vspkvrLwI065U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=pKbjgT4AxK+0xsqBBt9ImGqmcQZYOkS1q/b8JPioFc7uJQUh49SZ+39hOUGOflroMJ1Zb88pigYMV7DlKZZE/30rfZDpWWZYlZztw7KNGLBB4V/mYMTgEGCWLdHiwpzZBC4GMpx+fVZDibGyMP2jBRkyYFImSJtGLKMpScvOz0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=CzOhD+qz; arc=none smtp.client-ip=192.134.164.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="CzOhD+qz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=c6tfNjJqR+2ddnOI9tqldwvC2Q1KTWFoIHpWKWzAQ1g=;
  b=CzOhD+qzqVRituE0LFvD3y6G8u/HnMYbvHb/cgc31kdVEU5sOGVrB2Kc
   apPpTgLZ/yKpdTWZy1XFNzXoturn/g6GCPpL1R25yHB235zF4bsUnVDc3
   o1rdNOMSzgLYNyL2954oQAoA8IKsLiyobyzSRaq/29MuoLvOR0seoDLs8
   E=;
X-CSE-ConnectionGUID: ix/7jfKyR/y3wxVvum7dPQ==
X-CSE-MsgGUID: pugvvK/IRBGOB9Tbget9rQ==
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=Julia.Lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.23,111,1770591600"; 
   d="scan'208";a="140883526"
Received: from i80.paris.inria.fr (HELO i80.paris.inria.fr.) ([128.93.102.196])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 09:11:17 +0100
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
Subject: [PATCH] coccinelle: update Coccinelle URL
Date: Tue, 10 Mar 2026 09:11:12 +0100
Message-Id: <20260310081112.354802-1-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

The LIP6 URL no longer functions.

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---

I used the UTF-8 encoding for the email.
Let me know if this was not the right choice.

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

