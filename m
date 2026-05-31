Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69871E520A
	for <workflows@vger.kernel.org>; Sun, 31 May 2026 14:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780236139; cv=none; b=rOrTXwipZoIAmW9wQj1qZ4Q/QZLLbQOAXRJFPinTAyL6UL07g8fr3crg2PJioUO3Qv4F7yLCXraYKX71svowjp1aEuQ50bOQO8cA3TP3Me352P0m0yHCO3TVmyq3zWAwiJ2fHaPFEzDgS31u6EQFORsZ2f6+Ap+hqyHbbuOWFl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780236139; c=relaxed/simple;
	bh=1Mx9+JPAFFCXGppo/c4PNUomb6raQh6wwAYCvpR1FJw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OdG1NCluDlnNOGRyCN+GUp0Gc0Qc/kfXpeAdBXTEa+6ucqvtI/KNMHag6Jb+AVpmqDeoiT9nOhUQgCHQudUx9itVlR7ujErrl2LGLR9EfEJt5QPslpWUudZp5CxXfe9cuEhm5D4sFXCmrQ9TOWJJcm89+jdutxMaPvpY+/Nh9Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LcPgiMao; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=dAyoI7fP; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LcPgiMao";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="dAyoI7fP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780236137;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ysQ7pxIb9uu9MOTslWvzE+QCFksmJ15vilUFpcNr1vE=;
	b=LcPgiMaoFOP4arGKbUmV+gbsCa4aqwXJXEc3M15R6tLae5OJusP8+wgpsjuQMNDh9Wn5rm
	5hEJS6+cYeQ1MLt58ygw40n/sgQOAQXB6lsWfWggk0X7Z9PRjy5GImTMkPQl5TOVAZkNLR
	b9sUeY22ChuWiRi4HTg72U5omo+jY28=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-686-JJFE33ZJPWO2eK8KeJxaQA-1; Sun, 31 May 2026 10:02:16 -0400
X-MC-Unique: JJFE33ZJPWO2eK8KeJxaQA-1
X-Mimecast-MFC-AGG-ID: JJFE33ZJPWO2eK8KeJxaQA_1780236136
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-914f037b7dfso1090419185a.3
        for <workflows@vger.kernel.org>; Sun, 31 May 2026 07:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1780236136; x=1780840936; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ysQ7pxIb9uu9MOTslWvzE+QCFksmJ15vilUFpcNr1vE=;
        b=dAyoI7fPVentOlf9E062RSp1LexTLnlI9F01a4osB+BTpXPn2EVNuIWMAZuxTNfDV6
         e9cnH7X/w3OCZcOMItVckgD+VC8Uvv72cYz4NGV/WxmsYjLXhymIdbLpmAFRzj9fOuBr
         DilWQfGhRy9eUsAy9ppmYmzr+fDoeaH2at/d7j1b5knsoeP+9WwErfFEVeExrK3wOUQP
         cJQiowpkmy7MD3VO7ThwjzfgSlYsLQ6skhy358ki3XUspY79Mg55wv7zRTbkjBlR8D9t
         onqYtDq1QJ7OeLwaXzwlU7wB7y1bbMfaA0DUhqvt/7/kJbwThQCiwra/UWpI06yCeVkr
         bVCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780236136; x=1780840936;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ysQ7pxIb9uu9MOTslWvzE+QCFksmJ15vilUFpcNr1vE=;
        b=fM4bRwF2KfTRd3DFBPO+zAMd5sRHY+68xSfKxV1pIxCE8B0iJ003Dq3e4l+G0DvnoE
         CmKkQAX69vJIWynO6WG7prmDoPsxws7pp7k2pSOmDI1cpseYKpKiBAWdMU5hrWDgKCXX
         SKTlNEat81LUEcbQU619AwjnoTIq3isCGx0I5sPkLjm3f8iv/Q8LTs6YxZTQuyYSW2xO
         PyCBIrIhmGGKmHYNXnX5lZaFXNHWlTsMlowAmZeADNXAqH3rcQkM4GhniZcGJAXf35ZM
         B1vBg8h7bNWbfLLuSbmxKxkzbgMK8O28vKnerV1mNN54dcoaMtGBu1Q7PCYsTvBn7EQo
         WjaQ==
X-Forwarded-Encrypted: i=1; AFNElJ+oQrm9ytXYXIy3HPN9ZJDKG1a+n/vWeTdgf/gbr8pHkHjmq4Z5k4y2C3iLoRCyVl0wltvZBcBlNlE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxovdAbFzOhYj5RW7oyq7A2cTOSseOvCpyaSiXN7BQvgNucaMMQ
	9O+3/2BDKDm62PjBug1/lUZ83PvkkyGc6ODxBqWYsM8vSsbH73N03RuaIBpaBOTaX6Mph0tnVVs
	Li1prJvYHS4kYdjjqmNjPFPYCtQWkEaoPZ2GGgupbLqoTWW3YnQZ7fTowI9Ckjg==
X-Gm-Gg: Acq92OGRtDmo2cTdMVIMwiLcTRWSR+59mEVUOB9G6NyCriYIRUYMJygVLHr01MBt6wy
	rgEl/7cQCLW4qEd5zD31LBBgqZNmTSCAEwmPk8v+STsDRu1qwCdA8/fgcsb55KM32qEHKbKynzK
	u35zi59ObvXltyZiQ3jjvv8PC78/0VrguoXWCEBsm4vEWH3tM5DUKUNEaErAPj+pGKajUUzi0mz
	dmSf18pqF2Qz9o1pXaQRt5oFA1STw9Z1X86k0H1NZddRVgQFvymo0IV7oZX0TdK0JaAtLilI/g2
	ob1dzhY2sJrQmW57vu8S7a8KCAg6u6yGoGEq9A6A8ac/lI9FaAnL++q6HKwMpLeX2L+hCltITyZ
	U1NbTYG40YGbYCA7CT3KuJ7ZLCbN7uHzJS8g5nOdSChZjTA==
X-Received: by 2002:a05:620a:6ccc:b0:8ca:123e:819b with SMTP id af79cd13be357-9153d93ac41mr1169310585a.13.1780236135592;
        Sun, 31 May 2026 07:02:15 -0700 (PDT)
X-Received: by 2002:a05:620a:6ccc:b0:8ca:123e:819b with SMTP id af79cd13be357-9153d93ac41mr1169305985a.13.1780236135124;
        Sun, 31 May 2026 07:02:15 -0700 (PDT)
Received: from costa-tp.bos2.lab ([2a00:a041:e223:1b00:fe51:8bb:7986:c897])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9153244e114sm780182585a.5.2026.05.31.07.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 07:02:14 -0700 (PDT)
From: Costa Shulyupin <costa.shul@redhat.com>
To: Jason Wessel <jason.wessel@windriver.com>,
	Daniel Thompson <danielt@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	kgdb-bugreport@lists.sourceforge.net,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Costa Shulyupin <costa.shul@redhat.com>
Subject: [PATCH v1] docs: kgdb: Fix stale source file paths
Date: Sun, 31 May 2026 17:02:07 +0300
Message-ID: <20260531140207.4114764-1-costa.shul@redhat.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update two file paths that became stale when kgdb/kdb sources
were reorganized:
- kernel/debugger/debug_core.c -> kernel/debug/debug_core.c
- drivers/char/kdb_keyboard.c -> kernel/debug/kdb/kdb_keyboard.c

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Costa Shulyupin <costa.shul@redhat.com>
---
 Documentation/process/debugging/kgdb.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/process/debugging/kgdb.rst b/Documentation/process/debugging/kgdb.rst
index dd6a103073fa..c4d0a9121d52 100644
--- a/Documentation/process/debugging/kgdb.rst
+++ b/Documentation/process/debugging/kgdb.rst
@@ -696,7 +696,7 @@ The kernel debugger is organized into a number of components:
 
 1. The debug core
 
-   The debug core is found in ``kernel/debugger/debug_core.c``. It
+   The debug core is found in ``kernel/debug/debug_core.c``. It
    contains:
 
    -  A generic OS exception handler which includes sync'ing the
@@ -877,7 +877,7 @@ attached keyboard. The keyboard infrastructure is only compiled into the
 kernel when ``CONFIG_KDB_KEYBOARD=y`` is set in the kernel configuration.
 
 The core polled keyboard driver for PS/2 type keyboards is in
-``drivers/char/kdb_keyboard.c``. This driver is hooked into the debug core
+``kernel/debug/kdb/kdb_keyboard.c``. This driver is hooked into the debug core
 when kgdboc populates the callback in the array called
 :c:expr:`kdb_poll_funcs[]`. The kdb_get_kbd_char() is the top-level
 function which polls hardware for single character input.
-- 
2.53.0

