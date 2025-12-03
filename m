Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773A9303C86
	for <workflows@vger.kernel.org>; Wed,  3 Dec 2025 15:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764775745; cv=none; b=LBeKVru1y1rZlTzAr2TpmcjJ1PA+E0z+7CiFUmX5qxUW5HGy2eQa5Xw9nfXOlxxfoupTUCOWD/w8flYND0UfQFpr7KYwrYtU1UpvonaA6zxCWMHohs2jzKXYhd9RZ6apsmEP9csfQ8eoCo4FntS08wbzkSDgKL1FQXz9cT2go0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764775745; c=relaxed/simple;
	bh=ZP+a/lYHROshZoFv304670YZenCoDJjMnXixZoDRcgE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=qUPVHoIRIwA6449+nPVdFAKMmWxBEySfHaTvs/xhb3IpZoNzLdi5bU4wRDpXa+s/XPqIqGktsmy0c+RqC4frGZyABSSNda3c9t1lJEqpI/bpk1A1NUDhS135TIiFR/Rw8HerHnUQU6ut/GdQmD7PHYksB5mHVUJbT1mO+qZWkoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xviz1rHb; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xviz1rHb"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7b22ffa2a88so6702386b3a.1
        for <workflows@vger.kernel.org>; Wed, 03 Dec 2025 07:29:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764775738; x=1765380538; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LUOVPTJ4/dC2kl4p1iy88YkrusyzdxkNbRXdJXMfw68=;
        b=Xviz1rHbGcfdYpeIXa5gf/WA9MybYBa1huMRugdC6ykOw5nZHD55WSMYDfkyjX3X9t
         3la18H483WdyE3HbJ7YT/D3BWWbCbC1+71NlR6yM9RxVlRvKUSSzMfabABA9/dC0ZPay
         ddWDzoXVwUudqZH8nOhsqIwL6er0TQCWIgiTFnUU2sU3BC9taNRMe8J91eoQzSCIyREB
         tkdAlhVbQeV4TTB5nPqvP28JBhltgCadvchqwajt4N3otylEI8/m6jB5uKmLSzXY348k
         QntQzlvpotDIYKlo56ECX3GA2GLQuErACEC/RL2cehIvG2+Egq+tQoMHcOH9nLXWFWIL
         /KmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764775738; x=1765380538;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LUOVPTJ4/dC2kl4p1iy88YkrusyzdxkNbRXdJXMfw68=;
        b=tVId0uh5MEkL9kv//5OnWA2HIw2EPpfHh6TKgdOG/j4b3yxXXNYqs37tIR2egrmcxv
         sqPBPkzbRnglbA2jZtE/NvHDBnY8uko96zauum4asU/DW1lareenjGQbclpGHaDk1huF
         PYemw0VddcMBlcyV0i/1dteNjxD1C3Uv/VQ0VC9nteuvD/yA2A3lgKQY/AGTwUCbQZum
         ikpY0+kr7bFMDH9WdGQD3dtvQoBpUFJ65tS4FC456MmcIqUCcM0ZvDD9DBSnjW4Ura9m
         leMDrr/G7WXKc3LWs5ecGi/vjthAAupAtoa8AZUhPEZLQLt0V9e66Q3IgzuhrA06eHsJ
         XTkQ==
X-Gm-Message-State: AOJu0Yz2l9//52BmuluLrhhj+0AdC6zltKHiRetOVvxXGhTIi1qrpLLt
	hA6Owr3v98HVCrZ1DR69LhlmnC/2ixyhCSMr1e1GLrszzxQ8IYk88XQv
X-Gm-Gg: ASbGncvsb/zZKz5p3bvi9QxEuwQTr6AYNufS0CX45D/mTEygG0Ih2hsxOpyD6IFw8xj
	+8/rZhCuqkCnDLH3hQ53gF4hO12sshRedeTsu6ISC4cCFni6XZid89NhGobp5fX2sHcZzntkJ57
	z997OcVsXTivRCizHb6sS+PeKAxNCROnfl8ubgtd5lBGQUoEQ/sc2+GgjFF8PHR7q77V/K7omLa
	lFOLPyBmHH76zC6bpvF7MsNg2rI+gSmhhbZxWDjJfOY+tO7CnDaRbj4eFZtp5VIdAQ4qvhC5Hij
	zLLlsI95N2MrOSMrsfbRqim2O5q9uifKEwjT/RXG59Dflv4RkDegE08ulllKEm9uaVqU1orYVYw
	Sr+E6QbqFkX+3ArJx31y4YC9GLO7JTR5DtLMklCdpy+fWC7C9AU1CXbwllQ1F2K/R7QndQ5vR1X
	+AMWQC82fx
X-Google-Smtp-Source: AGHT+IEOsz1PzZbs/DYjU/JrirTTGiHXDESPnE5swa/vQS97QPodviOkxWFtzWwuhqltw1FaWZbskg==
X-Received: by 2002:a05:6a20:7346:b0:35d:7f7:4aac with SMTP id adf61e73a8af0-363f5e7a28emr3846587637.47.1764775737421;
        Wed, 03 Dec 2025 07:28:57 -0800 (PST)
Received: from aheev.home ([106.215.171.188])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-be509f4ee3fsm18234837a12.34.2025.12.03.07.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 07:28:57 -0800 (PST)
From: Ally Heev <allyheev@gmail.com>
Date: Wed, 03 Dec 2025 20:58:49 +0530
Subject: [PATCH v7] checkpatch: add uninitialized pointer with __free
 attribute check
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251203-aheev-checkpatch-uninitialized-free-v7-1-841e3b31d8f3@gmail.com>
X-B4-Tracking: v=1; b=H4sIADBXMGkC/5XQO27DMAwG4KsEmquCpKxHMvUeRQdapmKhiR3Yr
 tE28N2rZKmRLi44/Rw+Pq5qlCHLqA67qxpkzmPuuxL8007Flruj6NyUrAjIIhBqbkVmHVuJ7xe
 eYqs/utzlKfMpf0uj0yCibTT75K0gMKoiXQZJ+fM+5fWt5DaPUz983YfOeOv+z59RlwqpBqyjY
 88vxzPn03Psz+rmz7Q2q20madDoIuwBJKCBR9OsTbvNNGVPdj55qjFS3Tya1a+J4LeZVTGrQMS
 Oo6eQHk27MrfebosJ0ZKpkU2yf/7p1ubG210xKRnGxofkfFiby7L8AB9DT/p6AgAA
X-Change-ID: 20251021-aheev-checkpatch-uninitialized-free-5c39f75e10a1
To: Dwaipayan Ray <dwaipayanray1@gmail.com>, 
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, Joe Perches <joe@perches.com>, 
 Jonathan Corbet <corbet@lwn.net>, Andy Whitcroft <apw@canonical.com>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>, 
 David Hunter <david.hunter.linux@gmail.com>, 
 Shuah Khan <skhan@linuxfoundation.org>, Viresh Kumar <vireshk@kernel.org>, 
 Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, 
 linux-pm <linux-pm@vger.kernel.org>, dan.j.williams@intel.com, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 James Bottomley <James.Bottomley@hansenpartnership.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Ally Heev <allyheev@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4542; i=allyheev@gmail.com;
 h=from:subject:message-id; bh=ZP+a/lYHROshZoFv304670YZenCoDJjMnXixZoDRcgE=;
 b=owGbwMvMwCU2zXbRFfvr1TKMp9WSGDINwo0bpqxoOe038Uu9NjN3jfKUyjfq81Y4MkxhtPu35
 hqfv8iljlIWBjEuBlkxRRZGUSk/vU1SE+IOJ32DmcPKBDKEgYtTACZicZKR4ejxkwtn+4UkB5rV
 hN+NfvVD8f2DVPX17Nqp77iv6d6LWMDwT9OJkWea+xYlRXb22Iab1wWttdelcfyZ8ahn7byo6m1
 NLAA=
X-Developer-Key: i=allyheev@gmail.com; a=openpgp;
 fpr=01151A4E2EB21A905EC362F6963DA2D43FD77B1C

uninitialized pointers with __free attribute can cause undefined
behavior as the memory randomly assigned to the pointer is freed
automatically when the pointer goes out of scope.
add check in checkpatch to detect such issues.

Suggested-by: Dan Carpenter <dan.carpenter@linaro.org>
Link: https://lore.kernel.org/all/8a4c0b43-cf63-400d-b33d-d9c447b7e0b9@suswa.mountain/
Link: https://lore.kernel.org/all/58fd478f408a34b578ee8d949c5c4b4da4d4f41d.camel@HansenPartnership.com/
Acked-by: Dan Williams <dan.j.williams@intel.com>
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Ally Heev <allyheev@gmail.com>
---
Testing:
ran checkpatch.pl before and after the change on 
crypto/asymmetric_keys/x509_public_key.c, which has
both initialized with NULL and uninitialized pointers
---
Changes in v7:
- RESEND. Also, added Reviewed-by trailer
- Link to v6: https://lore.kernel.org/r/20251125-aheev-checkpatch-uninitialized-free-v6-1-2f3a1d78f678@gmail.com

Changes in v6:
- added declaration at the place of use suggestion
- Link to v5: https://lore.kernel.org/r/20251124-aheev-checkpatch-uninitialized-free-v5-1-0c523b1a3f5a@gmail.com

Changes in v5:
- fixed checkpatch doc
- Link to v4: https://lore.kernel.org/r/20251107-aheev-checkpatch-uninitialized-free-v4-1-4822a6ac728f@gmail.com

Changes in v4:
- fixed UNINITIALIZED_PTR_WITH_FREE description 
- Link to v3: https://lore.kernel.org/r/20251025-aheev-checkpatch-uninitialized-free-v3-1-a67f72b1c2bd@gmail.com

Changes in v3:
- remove $FreeAttribute
- Link to v2: https://lore.kernel.org/r/20251024-aheev-checkpatch-uninitialized-free-v2-0-16c0900e8130@gmail.com

Changes in v2:
- change cover letter and title to reflect new changes
- fix regex to handle multiple declarations in a single line case
- convert WARN to ERROR for uninitialized pointers
- add a new WARN for pointers initialized with NULL 
- NOTE: tried handling multiple declarations on a single line by splitting
        them and matching the parts with regex, but, it turned out to be 
	complex and overkill. Moreover, multi-line declarations pose a threat
- Link to v1: https://lore.kernel.org/r/20251021-aheev-checkpatch-uninitialized-free-v1-1-18fb01bc6a7a@gmail.com
---
 Documentation/dev-tools/checkpatch.rst | 23 +++++++++++++++++++++++
 scripts/checkpatch.pl                  |  6 ++++++
 2 files changed, 29 insertions(+)

diff --git a/Documentation/dev-tools/checkpatch.rst b/Documentation/dev-tools/checkpatch.rst
index d5c47e560324fb2399a5b1bc99c891ed1de10535..b6e02fb91e85710fecfc0a5e5c83a8e7f32d1d3c 100644
--- a/Documentation/dev-tools/checkpatch.rst
+++ b/Documentation/dev-tools/checkpatch.rst
@@ -1009,6 +1009,29 @@ Functions and Variables
 
       return bar;
 
+  **UNINITIALIZED_PTR_WITH_FREE**
+    Pointers with __free attribute should be declared at the place of use
+    and initialized (see include/linux/cleanup.h). In this case
+    declarations at the top of the function rule can be relaxed. Not doing
+    so may lead to undefined behavior as the memory assigned (garbage,
+    in case not initialized) to the pointer is freed automatically when
+    the pointer goes out of scope.
+
+    Also see: https://lore.kernel.org/lkml/58fd478f408a34b578ee8d949c5c4b4da4d4f41d.camel@HansenPartnership.com/
+
+    Example::
+
+      type var __free(free_func);
+      ... // var not used, but, in future someone might add a return here
+      var = malloc(var_size);
+      ...
+
+    should be initialized as::
+
+      ...
+      type var __free(free_func) = malloc(var_size);
+      ...
+
 
 Permissions
 -----------
diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 92669904eecc7a8d2afd3f2625528e02b6d17cd6..e697d81d71c0b3628f7b59807e8bc40d582621bb 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -7721,6 +7721,12 @@ sub process {
 				ERROR("MISSING_SENTINEL", "missing sentinel in ID array\n" . "$here\n$stat\n");
 			}
 		}
+
+# check for uninitialized pointers with __free attribute
+		while ($line =~ /\*\s*($Ident)\s+__free\s*\(\s*$Ident\s*\)\s*[,;]/g) {
+			ERROR("UNINITIALIZED_PTR_WITH_FREE",
+			      "pointer '$1' with __free attribute should be initialized\n" . $herecurr);
+		}
 	}
 
 	# If we have no input at all, then there is nothing to report on

---
base-commit: 6548d364a3e850326831799d7e3ea2d7bb97ba08
change-id: 20251021-aheev-checkpatch-uninitialized-free-5c39f75e10a1

Best regards,
-- 
Ally Heev <allyheev@gmail.com>

