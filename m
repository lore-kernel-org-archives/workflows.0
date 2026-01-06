Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE57C33B6D5
	for <workflows@vger.kernel.org>; Tue,  6 Jan 2026 19:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767726565; cv=none; b=UZR96nUCXbyO9/oTPO/T/CxWLGnJ1I5K3bA6DDUnBLcVcFIgVseCm03MtyWxBiHPKtonRINKJG1AgxyJUuohCOng8m7Njc0zgUZJSdgwxSXDFQg54iEl/j1H1647SHLwnQEQ+S8wJElyuuh1mAYE2vcNLIgntZVZwOjlfME6e9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767726565; c=relaxed/simple;
	bh=RX9qHaUriBcnZk/sTEJF3KSyASsPGsLPByLnwAt8Oac=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S8lwnveX+vhcOxkgwQv/uTLU+W4U7aHzV3frYApv0D7bPlvdNXTamuufFEVRpGAmyUx2nxEkoXqUGaS0dwDg7gH7EVcc/1EHXKAPetVw0ATT98fUF0af6Lv6TWP+xCvxXFaprvKij4WlQda0FNB7bveSUCKlC3HSRl8nCGUotOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IqFHHgEZ; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IqFHHgEZ"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2a0d67f1877so14820825ad.2
        for <workflows@vger.kernel.org>; Tue, 06 Jan 2026 11:09:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767726563; x=1768331363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BATdJWgJUwnMbHLsMBqXXAerZpaNwXBAjVbJPcNyAvU=;
        b=IqFHHgEZFNpnSvJV7KojPs4eDuqArBFg+N296nq7PoPo6wSKe70NsduqZvKT5kQTKD
         w3Y/uY3huuIOXBUagPfYhj3arPn8m2dJ+wOJBVaVfESXoasrfUWAwnlcE7kQGdb9iVtZ
         5vXXbl1ZTSZL7GSFe5LxVnlBNAh/RMqqsg53jPVKKgzzJ00cKmdYMDlntoe+2dmwv5Iz
         CoQXsexy9cOvnMCvCq+qsvKk6pgSc8O1/hiF2BCT58eGcJ9MqOV7ap/xWFFd7pStoE9I
         yzLiZdCWJeBtXU44m5MMsrDlwfHsnVQeiuZ98w5xvpE8/Tupp3X/kYT5Mcxlv8avJMHD
         ns2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767726563; x=1768331363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BATdJWgJUwnMbHLsMBqXXAerZpaNwXBAjVbJPcNyAvU=;
        b=su7U6+Edvlnms4tq5EmgBIsR4dYFSD09k2isk15D4MSE9CCM9qpsPVzMF0Y66GjXL7
         yXUHsOumNn1uGlSRDPHsvCoRzPXqcwdVEGLXgBl0HBfjMWHGE7VIJWfp7vzmVJmjVkBS
         QLH9+MHBzgcY6vICSZ541EI8eWTR4USv2PB4dmuXKWqX1KAcg400AB1hO2wfMMjzXPpL
         SNAWyM0xIE+c4LHFBOAPhz8hBFEkFu78J85Eukw7H4XlO7BXz7icoC6BYdMwqxMBY2Kx
         wGzOBVvM9/H1KPyOBksF08XLyCfAxNp3sO3wED6Fmbm8Tfxd65/BHYxc1XMofVel3R2k
         znDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUf8leXz0NaAmh+rtkkDqsOL9H2v+FG0miPMW5AtFZZHBK6DNjveQVICui3b0dt11qLWRZ56apULso=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvSb6OiUEeLSn3AX9Z00v5VyOFoSb3NV52dAwOjUNohAEIdoeA
	WacBxP5KTGmdvlkq98EMXJ+SS8wPgJuIBNWuD2jqhK4SPGnsxYgO7fHf
X-Gm-Gg: AY/fxX6aH9q8IP/9W0xxtrYmj1z7Y4aGvQRiyFQBVEGD71AorwrWqOuWIZrahi4a/iL
	XxOp3zEsVbCmeXzuj2h7cc6MEZTWa0JdL29uqXAELmT2udtGTg+l/Y5NfxZs9itMvucE3Pr3kE2
	mU7f6QfcgxuViaDHFuOpB8Qdz4NmEXmv7vYHvCnP3NU1khhkx67nte/GPItkPJKL9Odrt3YsFrB
	TJHOSWUCiBUitWFXY8HUKwVcQqy2R/Rtn+MCjveRu1JvFCLQE04ZGkq3RWIKXFHvXyIlPZeH15Z
	E11ijm5PRPkvMmDayGGkzJhRmIUb6PGW0bziSPOAkKApjvkZpFtBIRup9+cjyqbU9XXHwp4yrBd
	osgIW9yku4mn5ePUDo+3C6WTuGgKKoBslZUsRR9DjeFnWE8HYtdCLqoi7t7yX7kFDEOnUv5Or/Y
	4xc+nJ9eeappbJ92k4IQ==
X-Google-Smtp-Source: AGHT+IEv3DyNwRK5RvEmcexsucGDjZhsLc4jeZexw6MFns14bMGlit2ognMpseLu1Intl2qBeIsDAw==
X-Received: by 2002:a17:903:2c5:b0:295:fe17:83e with SMTP id d9443c01a7336-2a3e2cbb647mr42089515ad.19.1767726563165;
        Tue, 06 Jan 2026 11:09:23 -0800 (PST)
Received: from rivendell ([101.0.62.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc78c0sm29380975ad.69.2026.01.06.11.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 11:09:22 -0800 (PST)
From: Benjamin Philip <benjamin.philip495@gmail.com>
To: Julia Lawall <Julia.Lawall@inria.fr>,
	Nicolas Palix <nicolas.palix@imag.fr>,
	Jonathan Corbet <corbet@lwn.net>
Cc: cocci@inria.fr,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Benjamin Philip <benjamin.philip495@gmail.com>
Subject: [PATCH RESEND 2/3] scripts: coccicheck: warn on unset debug file
Date: Wed,  7 Jan 2026 00:38:35 +0530
Message-ID: <20260106190836.36630-3-benjamin.philip495@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260106190836.36630-1-benjamin.philip495@gmail.com>
References: <20260106190836.36630-1-benjamin.philip495@gmail.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

coccicheck prints debug logs to stdout unless a debug file has been set.
This makes it hard to read coccinelle's suggested changes, especially
for someone new to coccicheck.

From this commit, we warn about this behaviour from within the script on
an unset debug file. Explicitly setting the debug file to /dev/null
suppresses the warning while keeping the default.

Signed-off-by: Benjamin Philip <benjamin.philip495@gmail.com>
---
 scripts/coccicheck | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/coccicheck b/scripts/coccicheck
index 2efb74afef2b..8dd766009de1 100755
--- a/scripts/coccicheck
+++ b/scripts/coccicheck
@@ -260,6 +260,11 @@ coccinelle () {
 }
 
 if [ "$DEBUG_FILE" = "" ]; then
+    echo 'You have not explicitly specified the debug file to use.'
+    echo 'Using default "/dev/null" as debug file.'
+    echo 'Debug logs will be printed to stdout.'
+    echo 'You can specify the debug file with "make coccicheck DEBUG_FILE=<debug_file>"'
+    echo ''
     DEBUG_FILE="/dev/null"
 fi
 
-- 
2.52.0

