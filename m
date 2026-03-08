Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B5EE1D5CFB
	for <workflows@vger.kernel.org>; Sun,  8 Mar 2026 10:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772964547; cv=none; b=PJ14e5jlDioDQ7LIvEf+b0Qepcw5MCbZacc99G3GeSybXiKA86+LE2usEK0LAdxt6JivWl5KXn0M0GnyZFZInYFnv5nWmAYY+FLOzoZFb5S9b/Rp6Ez5X4VCoM5zkbSuUMdk5Gu0NgNt6TBrbGD+TXPunvkrnbkpr39KZ8WRlLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772964547; c=relaxed/simple;
	bh=0qt2ThSNTWiZmg2rDlobjJhGOvWAhqJsncOokbb+v2s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hteNKZK0WbGvNZ5FRcYbHMF/n4FgxgFnLL6lt9FrJcbPSIVcH2Y1iW+TywHZ/e9cUE5OYDqy9+gNrJfcmsp0/b8lrw9b9gaANR/UayoNpUW7AsYDyHBKsDFw5DPNVAr2O9rqZCdczKv7fmvr5aM+Iy76GSJPpxE6aoJm1O78ts4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cUN9LS5n; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cUN9LS5n"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c2af7d09533so6781501a12.1
        for <workflows@vger.kernel.org>; Sun, 08 Mar 2026 03:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772964545; x=1773569345; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GgQbVckhgGW8jAzdnaHbqifi/n1uJ4U/1Ga2qYPhdCI=;
        b=cUN9LS5nd3eSdGEsYGpd3gTeSMi4qaAMDFBq5lPU9XxAWlfv+cwB1Et+1w1fUBOlRY
         I2gNwe818Icd3mqFOf0kl3Nme4hX3VAVV8ZBkgUspGt/OAl8ia2XEdIEVmhdgTIBUxns
         /k0XROuYhfaxibFxK4VfA2NvtoGPcHQL2TawphN4tWS5tuPe1mSrlouN7GNBMXhBS6ZQ
         IG6KPN9CRs8TYr6YLuIhS8DOgO+J9RpTlLHYT/WsY0a9OALbvbj8eEi+yAKnXNbvprdB
         QXncLf7hhDrjS7BhD5aeRF7dUnberlkH2cGuqCz+O4aQbUY5jQUCoKssD56A1bYv/mHc
         GYWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772964545; x=1773569345;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GgQbVckhgGW8jAzdnaHbqifi/n1uJ4U/1Ga2qYPhdCI=;
        b=EUpnmTp/zraVpapxVwcyYm02SKedqoXk5f3m9UnpOxII2/1MY/L43eJiUN9G0CV21t
         9gRX1gQv8JEvlzcHk/7RNB7Btx1AjeH35AjAJ2zI3WjopLplWRYrnkTM+LyOBtPu8RcE
         BBSblVGs4Q/1Dgnu1/hof6zAMc6aX8i3TSdmpbVYBsT5GlQdvvCH+1T/WiIEd5pmsJXp
         QlYyo4Dc3Mio8Km+bLvwKz8YfI/9JUUNNcnCRKLlFQohhuB1px6zA0o6a0f6LNq2X034
         d7ikPaCs4rCJoa9/Hj8A1V1AysW080H3AhuTPKENOnV32sjvsEs3SEuTx8ohOwN+bA8Q
         DEAw==
X-Forwarded-Encrypted: i=1; AJvYcCU5k9yYxuweDsbALHzhC06oaX2VDqiV+c8gofL+KFOvh5U26Q3NXQDssQ50AvEIw20v+Z/ffrQfn1o=@vger.kernel.org
X-Gm-Message-State: AOJu0YynZuXFzugPTnj2Y/JSmBJ+MbbeEkSaNG27KhPCwgpaAI060FOO
	U7Mh//ItxlUq9VHmVqjPGSaJqhtQiqvNZeG474nXf/nl8BaOhBrNYmaG
X-Gm-Gg: ATEYQzzlGVUGfxHculegP0JetYKYiwADZNlcqd2dHNVhSqdmbYUOM4xQwHydJPtG6q+
	goP0Uw6gn/Gh5X6wVU/rpOiMD+HBbDuEdhUuny0vQmO/Vduf8leIrbknaYma0FS7gxNoD2z/VlP
	hLJ3VQj7fH8K4m7HvJYKGIG1qWoZNBCTT6FKmpEwlRY7snsU+pCpSfT7SsHCgepOp5lMT1ogewE
	iq4WjeEA9cXy1YG44sKUdW9TpLmN2idq5P03WhkrzBx6mgs/fOPIcC8KFV1MOLARDLVsg3NoYbg
	hiqUiHg1pNJzL4uituOCaUkBiajJHfTS0kfu9Yh+HtdhDi+VRihQ9WO7SYlnTa0mhGuToWUYdGU
	qf7kqMtkKB0FkC/pqpp4BEcJR+h8H+rYplZUA09XqYuo752g4tC9cX8kULQR+4CBcxJK4OCNsSZ
	fE2cIbsPe7crbyhvkkeYPT01+ZWnF1caX8T7H9mkeb
X-Received: by 2002:a17:903:2c04:b0:2ae:4fc2:d951 with SMTP id d9443c01a7336-2ae8243b629mr81098495ad.27.1772964544798;
        Sun, 08 Mar 2026 03:09:04 -0700 (PDT)
Received: from russ.ust.hk (wf121-083.ust.hk. [175.159.121.83])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e58592sm102980485ad.14.2026.03.08.03.09.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 03:09:04 -0700 (PDT)
From: LIU Haoyang <tttturtleruss@gmail.com>
To: Julia Lawall <Julia.Lawall@inria.fr>,
	Nicolas Palix <nicolas.palix@imag.fr>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: LIU Haoyang <tttturtleruss@gmail.com>,
	cocci@inria.fr,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] docs/dev-tools: fix a broken URL in dev-tools/coccinelle.rst
Date: Sun,  8 Mar 2026 18:08:50 +0800
Message-ID: <20260308100851.341-1-tttturtleruss@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The original supplemental documentation for coccicheck is
https://bottest.wiki.kernel.org/coccicheck, which redirects to a not found page,
thus change it to https://bottest.wiki.kernel.org/coccicheck.html,
which adds a suffix to original URL to make it direct to the right page.

Signed-off-by: LIU Haoyang <tttturtleruss@gmail.com>
---
 Documentation/dev-tools/coccinelle.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/dev-tools/coccinelle.rst b/Documentation/dev-tools/coccinelle.rst
index 2b942e3c8049..f73ccf5397f3 100644
--- a/Documentation/dev-tools/coccinelle.rst
+++ b/Documentation/dev-tools/coccinelle.rst
@@ -61,7 +61,7 @@ Supplemental documentation
 
 For supplemental documentation refer to the wiki:
 
-https://bottest.wiki.kernel.org/coccicheck
+https://bottest.wiki.kernel.org/coccicheck.html
 
 The wiki documentation always refers to the linux-next version of the script.
 
-- 
2.53.0

