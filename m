Received: from 5.mo584.mail-out.ovh.net (5.mo584.mail-out.ovh.net [188.165.44.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F92E1E991B
	for <workflows@vger.kernel.org>; Fri,  5 Dec 2025 11:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.165.44.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764933400; cv=none; b=byjcPDByzuXlHgtho4Ov0kuNF1tAWR6yTL153Cf4rwWwIXsLVvvNZxKNOMdf2tp76j4eRjyoBZQv2aPhFiiESso+mH17mewYR0YlgCQYmRSDFKSCgev7UPLt/6c31p6sBc8TnlYi6Qb5dBobMFH8e873kdUUfx7WkVpLwTCuAeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764933400; c=relaxed/simple;
	bh=0y8gWCwvAYPTEPR4GrcXZMsdKqyzuZXHH/UlG6ZhIrU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=shR/dOn7RcQW34DJZrgQ4M+xy+pWAzMrQ2/n756BY1hJAEtQj/GjtcnSqJ3VuxvnQJmyfmeDPKrEvzoNhmP5q8aw7mSuOSvBVSULQnHq5I9cmpmFReRUKGOpXOeyLzsTXzt0SuvH4WWZt01aomHkEpZaJ9YAZ/FYP6NvipK14s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=etezian.org; arc=none smtp.client-ip=188.165.44.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etezian.org
Received: from director2.ghost.mail-out.ovh.net (unknown [10.110.37.17])
	by mo584.mail-out.ovh.net (Postfix) with ESMTP id 4dN82p3VTvz8QXL
	for <workflows@vger.kernel.org>; Fri,  5 Dec 2025 11:16:34 +0000 (UTC)
Received: from ghost-submission-7d8d68f679-6f9hm (unknown [10.110.188.17])
	by director2.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 21E0BC0D34;
	Fri,  5 Dec 2025 11:16:32 +0000 (UTC)
Received: from etezian.org ([37.59.142.99])
	by ghost-submission-7d8d68f679-6f9hm with ESMTPSA
	id GEvuNA+/MmmXPwIAHLfwXQ
	(envelope-from <andi@etezian.org>); Fri, 05 Dec 2025 11:16:32 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-99G003bce61c53-f9df-4629-80d3-adfd3cc59745,
                    EAC13B2666E74075D157C5892600FBB33BFAB6DD) smtp.auth=andi@etezian.org
X-OVh-ClientIp:178.82.31.9
From: Andi Shyti <andi.shyti@kernel.org>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	workflows@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>,
	Andi Shyti <andi.shyti@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Federico Vaga <federico.vaga@vaga.pv.it>
Subject: [PATCH] Doc:it_IT: Do not reference kernel.h anymore
Date: Fri,  5 Dec 2025 12:15:58 +0100
Message-ID: <20251205111559.3089219-1-andi.shyti@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251126214709.2322314-1-andriy.shevchenko@linux.intel.com>
References: <20251126214709.2322314-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 13768067014224841408
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTEtft+QIHmN8rhve/XJrxp7CQYtpe+20sAh2Uft0XxdCpEXwObGCxLgpkAtOqFRv3EkSYqwVXeMgvl948qz7dtDx4HaczuMm6Y6k6NIZ6U23hlqYFFecRQ0Qdj0hmEMO5EiFDpgQy8e5pFZF+avOzGs5RjVYuOsgGb282fq3XW+1MXCPq6s3q5PnUvBpnlrb2PWQV90yAxuvTZ8XDyar0anPfXS3WT+tYDpwypWGjYfL8jEibqCyoWWB8Ya/3Tu1LjFk19XQrNq2DN+c8o5VCWKpTNBut9nwxy79NCaSzTRvZJdJYFKksuVpFoUdcX4KcQKxPrfnU0EOfcgFNYc5by1iplS9nQkdh70lBGRAMHdsRxAbAMV5071y2B1dNH1ZapHdSXEqLyxhtpsAEdUMbvkjzgILkIbafJ1V8Br8x1yfLz6B2c4lreieEEZN1Z8dBd+gdsbBKhOCnTRCs9J8HnuHUfoJPHNy+aR5FKLKstTxtkQ2T497KgmQr1R7KXWN1tW2ZWrT1/c30VMHi6QRN/FikoxWAab61ne1Ds9gE6ng9/jyQIuARWDxex046TddXW7bo4jEpL4ZU7d+XrBAvrXXXww64PegX/ua6FOOauz4hv5dbp9ni+H70iCRvmWfxw2PflyhmL+GZ+xFtYThZiHpV+G7tHMKcuRrxMgUC8hwQ

coding-style.rst still references the kernel.h header, which is
being phased out. Remove that reference and point to the proper
headers for the examples instead: array_size.h, stddef.h and
minmax.h.

Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Federico Vaga <federico.vaga@vaga.pv.it>
---
Hi,

Following Andy's suggestion, and as a native Italian speaker,
I am updating the Italian translation of coding-style.rst based
on his original change.

I also took the chance to improve the phrasing in a few places.

Andi

 .../it_IT/process/coding-style.rst            | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/Documentation/translations/it_IT/process/coding-style.rst b/Documentation/translations/it_IT/process/coding-style.rst
index c0dc786b8474..b2fd74528de5 100644
--- a/Documentation/translations/it_IT/process/coding-style.rst
+++ b/Documentation/translations/it_IT/process/coding-style.rst
@@ -1068,15 +1068,17 @@ può migliorare la leggibilità.
 18) Non reinventate le macro del kernel
 ---------------------------------------
 
-Il file di intestazione include/linux/kernel.h contiene un certo numero
-di macro che dovreste usare piuttosto che implementarne una qualche variante.
-Per esempio, se dovete calcolare la lunghezza di un vettore, sfruttate la
-macro:
+I file header presenti in include/linux mettono a disposizione numerose macro
+che è preferibile utilizzare, evitando di sviluppare implementazioni
+alternative. Per esempio, se dovete calcolare la lunghezza di un vettore,
+sfruttate la macro:
 
 .. code-block:: c
 
 	#define ARRAY_SIZE(x) (sizeof(x) / sizeof((x)[0]))
 
+definita in array_size.h.
+
 Analogamente, se dovete calcolare la dimensione di un qualche campo di una
 struttura, usate
 
@@ -1084,10 +1086,11 @@ struttura, usate
 
 	#define sizeof_field(t, f) (sizeof(((t*)0)->f))
 
-Ci sono anche le macro min() e max() che, se vi serve, effettuano un controllo
-rigido sui tipi.  Sentitevi liberi di leggere attentamente questo file
-d'intestazione per scoprire cos'altro è stato definito che non dovreste
-reinventare nel vostro codice.
+definita in stddef.h.
+
+Ci sono anche le macro min() e max() definite in minmax.h che effettuano un
+controllo rigoroso sui tipi. È consigliato consultare i vari file header per
+vedere altre macro già disponibili.
 
 19) Linee di configurazione degli editor e altre schifezze
 -----------------------------------------------------------
-- 
2.51.0

