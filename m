Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795680735;
	b=TmkgWM2LdZWrH29foyKpv5aB/TyhN8MwOxBKJP1OVN7FcY2jl+EvUvuc5Nw8I0WJvpw7
	 xuu/1zZ76XlYZXGiiIAFv40gdHvRCBiVLcBAthoI6sIFz6A5WLKdCkZFYAed2UaEyCHXG
	 6aO57G9mv1xJoAVncO+SC5RY4KSs2CNemL6NlKB9DsFTd4zFs/vt1H3vNgUQMmKW920WL
	 IufXFm/JuyIDKz0QI023i/PwXQOuXbfgelS8Vrz7lduhP35+9NEbVxce5Hk2RWc/s0zgq
	 /WfeYJJ0egYum8gLW2t/3bBH17zEh5j/bYCQXvODAFjsSlRwKEhHLOGkLFyfzkHvQRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795680735;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Type:X-Change-ID:X-Mailer:
	 Content-Transfer-Encoding;
	bh=aEhyTJ8dta3Tyq6V/L5LudIzKwOEoZUem/yxKoS2X7E=;
	b=Yv1Mx6tSMpU7EsLw/yPnF32qZbRKtPEZDXK79me5KtPUXBlOiT68BJmqSN7J33q1U4uD
	 OqKuFUlxuBMT/yHGwgOwJuLCUQpqhHsEN8EAf3luiY9Y6Us9B6tJHrGGyKVkaDIp/8Lu6
	 egFtGX6L78u8r+ndeuEiIK2TsB1pIXqywyWKAUJEBII35UTxoDe1YoIFVZQ6n3jao1JFj
	 uPGd1bGcUoWRwoyg9vZ0ImQV16WXfscanE3riyVPdaDHANjdzTQWzU14nvlhjB2f62Ul5
	 YID4UBOFC3k5i1Q+Ac3lrwLSyd33sH+DVytahOdE5B5npoJVZp1IPoP6ATzZvLFc72g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kkBRiaEA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85FDA606A32E;
	Thu, 26 Nov 2026 08:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kkBRiaEA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DF171F000E1;
	Thu, 26 Nov 2026 08:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795680735;
	bh=aEhyTJ8dta3Tyq6V/L5LudIzKwOEoZUem/yxKoS2X7E=;
	h=From:To:Cc:Subject:Date;
	b=kkBRiaEAX5nr1v/77fYTVJZSJ6x/FlQeMoFTtne3qUvIB9NHZTcdzmaSPSF7k8/4j
	 52w9QavAN9x8ZKZUBgtaSswTeq2yKwA9jIVrMKuwtwegevJuEoFSo0h0isixjPQZSh
	 lYJOCtnpdi2QHWS0qxKxfRpGqAUImzR2+M5qbL9Fz4mumKpHAewpp73O6zGY977zBZ
	 O22pbmX84U7wizCcL5W7JRRQ5FRmQsAhOpWNR7us7Q9CL0T/i9Fy02Ve2DiXhU991U
	 qFijqACX6Nykwo36MUfY7Sd2e1kK1WEIJ63imUjbBY9G4R1T2/4PpsNE86R9W8UPod
	 tkUVr74vvr9sw==
From: Leon Romanovsky <leon@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Cc: workflows@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH] docs: submitting-patches: Limit backtrace trimming to timestamps
Date: Thu, 26 Nov 2026 10:12:08 +0200
Message-ID: <20261126-backtrace-timestamps-v1-1-0a645b25e5ae@kernel.org>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Post: <mailto:workflows@vger.kernel.org>
List-Help: <mailto:workflows+help@vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
List-Owner: <mailto:workflows+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20261125-backtrace-timestamps-29880a2f1cab
X-Mailer: b4 0.15-dev-18f8f
Content-Transfer-Encoding: 8bit

From: Leon Romanovsky <leonro@nvidia.com>

AI tools tend to trim backtraces too far. Taint flags, module lists and
module names disappear, which hides that an out-of-tree module was
involved or that an in-kernel API was misused, especially a driver API
that is not meant for general use.

Ask authors to remove only the timestamps and drop the example, which
shows a trace reduced to bare function names. Timestamps are the one
part of a dump that adds only noise.

Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 Documentation/process/submitting-patches.rst | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
index 85ba046d66fbf..56b1b38ac59cf 100644
--- a/Documentation/process/submitting-patches.rst
+++ b/Documentation/process/submitting-patches.rst
@@ -763,22 +763,10 @@ phrase``, it is important to be both succinct as well as descriptive.
 Backtraces in commit messages
 """""""""""""""""""""""""""""
 
-Backtraces help document the call chain leading to a problem. However,
-not all backtraces are helpful. For example, early boot call chains are
-unique and obvious. Copying the full dmesg output verbatim, however,
-adds distracting information like timestamps, module lists, register and
-stack dumps.
-
-Therefore, the most useful backtraces should distill the relevant
-information from the dump, which makes it easier to focus on the real
-issue. Here is an example of a well-trimmed backtrace::
-
-  unchecked MSR access error: WRMSR to 0xd51 (tried to write 0x0000000000000064)
-  at rIP: 0xffffffffae059994 (native_write_msr+0x4/0x20)
-  Call Trace:
-  mba_wrmsr
-  update_domains
-  rdtgroup_mkdir
+Backtraces help document the call chain leading to a problem. Remove
+only the timestamps and keep the rest of the dump unchanged. Taint
+flags, module lists and module names show whether an out-of-tree module
+was involved or an in-kernel API was misused.
 
 Commentary
 ^^^^^^^^^^

---
base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
change-id: 20261125-backtrace-timestamps-29880a2f1cab

Best regards,
--  
Leon Romanovsky <leon@kernel.org>

