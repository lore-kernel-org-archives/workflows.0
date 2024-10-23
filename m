Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66CF81FF7BB
	for <workflows@vger.kernel.org>; Wed, 23 Oct 2024 22:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729723476; cv=none; b=liBvV1aq+t14BVrpus0Jz9RIWghbPfVx/iFqRXRfbLrqPIs77D/BhC0whh/c3mZWjPHAz14LXmtFkHcQ7qSP9Mcr8Q0wc0ZM+H2Axj0j/dyfVfUf3Byy35scqBdyQq6KDe8WHQ5lDulDMrQ6N7DniM0E2TxQoQSG4qkF+ppZCTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729723476; c=relaxed/simple;
	bh=XCT6aaTLHKjPcWknzKtL2kN2dgyL7VsWQXuDCGu+eS8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=gn+KQg53yBLD13+iVl6CndZCYhtC8hBhv2PNkl6nbqzMb3TJoPlEg3tk/4Orlhkz9Z91moFGISFbzaeTSlAC+tXq7t8snOtfoDWcY6lM4hV1vaHbf/q2qbDhcpSjuvwmKAg2EgJpVmYY8OpJzJPVu59QlUejzp3AwSm0BWoASRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Y15+4WaL; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Y15+4WaL"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e2954ada861so633940276.3
        for <workflows@vger.kernel.org>; Wed, 23 Oct 2024 15:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729723471; x=1730328271; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/vLG0anO7BwgfLeQ/LDy3VoS1eB3+zLyO2ls8DxPK6U=;
        b=Y15+4WaL9f2YwCx9FobQYnPOV/9bX7RSrqLtTofv9PGFGi24GFoq3ey7XRRqj+wrT/
         VHJ/mZLyQpSqk3CdTq1b3GQ2B0QIi0zNrIo+sFgIQpY0HeKFFWBpRqVECPw8swWyN1jP
         nz6ZWttz80n6Y3ZohdQwd2FaIm4LS181iuxT00r85dECNRHU0b8ydyaHkLOG3EomeON6
         h3fKLlahVk1lO0lRDw/GHUUmIGOyMa3AlxRqy09Z8/TpLZeFVApCdJET6ye68oQZXin4
         PjKSnQiTh4nqB7utMMlbRUD3LJftCOx5FLnCvmHfF52rvF43A8OC3lb6n89iUEAwsqYV
         qsLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729723471; x=1730328271;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/vLG0anO7BwgfLeQ/LDy3VoS1eB3+zLyO2ls8DxPK6U=;
        b=egr2EyyQf6Uy7LZ0PkPpsGid5scaknXy2Qii9wF11p2D/R4Dczf3PdoO0OYuo10m3c
         5SfpE2427zlLbLKoTnRkdJ2YuinukAhL3bGr/OLHEoflPAethtlYH1y5RTXUvqSmaBKi
         aiMxqxZpNjXZ2sjjbuxbvRXt41Ceo6677IrGdMKivE9Zp9v1/gJM31DoOG+kVgfSd0Y7
         8EStjGiHrBGMWsuwUHZBoiWGwf7U1m5AURhYPFwtuQjK+/Z9hiGam2jAfKMiabCTB2J8
         /1Zfjaf3ltBodt+s4OUiXyId2WPd7qMX/W4JF8yy9ZvNwcEtrjSGMQsQ2wDE5E8mSq5v
         OZrg==
X-Forwarded-Encrypted: i=1; AJvYcCUsXkOMLXxYLTrWYHWO40nefSqJAY6amgyaz2eeig+G/HebYuJTHSrc7A7PQQJtZWF4TaNZmbQwCbE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbKSxBQhf05HQgw/9XiDQPlQlp3UiL7LtC2fM/czPbpuBGWXPr
	9xYqsZORmSx8IBro9vjvfwPCYO0yLS/snDnhbg1jdpiq0hR4EQyLQ+GAaBLLZSeiMg==
X-Google-Smtp-Source: AGHT+IFVfeyPxqRI2j0ASqUhKvoQx2zCQAV5DC4JpUQnoNgn6IsLNLrBhRCJGUXKM0TlEVsIqSS9Uj8=
X-Received: from xur.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:2330])
 (user=xur job=sendgmr) by 2002:a25:b307:0:b0:e25:6701:410b with SMTP id
 3f1490d57ef6-e2e3a652cf0mr7023276.5.1729723471236; Wed, 23 Oct 2024 15:44:31
 -0700 (PDT)
Date: Wed, 23 Oct 2024 15:44:01 -0700
In-Reply-To: <20241023224409.201771-1-xur@google.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241023224409.201771-1-xur@google.com>
X-Mailer: git-send-email 2.47.0.105.g07ac214952-goog
Message-ID: <20241023224409.201771-3-xur@google.com>
Subject: [PATCH v5 2/7] objtool: Fix unreachable instruction warnings for weak functions
From: Rong Xu <xur@google.com>
To: Alice Ryhl <aliceryhl@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Bill Wendling <morbo@google.com>, Borislav Petkov <bp@alien8.de>, 
	Breno Leitao <leitao@debian.org>, Brian Gerst <brgerst@gmail.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, David Li <davidxl@google.com>, 
	Han Shen <shenhan@google.com>, Heiko Carstens <hca@linux.ibm.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Juergen Gross <jgross@suse.com>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, "Mike Rapoport (IBM)" <rppt@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Nicolas Schier <nicolas@fjasle.eu>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Rong Xu <xur@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Wei Yang <richard.weiyang@gmail.com>, workflows@vger.kernel.org, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Maksim Panchenko <max4bolt@gmail.com>, 
	Yonghong Song <yonghong.song@linux.dev>, Yabin Cui <yabinc@google.com>, 
	Krzysztof Pszeniczny <kpszeniczny@google.com>, Sriraman Tallam <tmsriram@google.com>, 
	Stephane Eranian <eranian@google.com>
Cc: x86@kernel.org, linux-arch@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

In the presence of both weak and strong function definitions, the
linker drops the weak symbol in favor of a strong symbol, but
leaves the code in place. Code in ignore_unreachable_insn() has
some heuristics to suppress the warning, but it does not work when
-ffunction-sections is enabled.

Suppose function foo has both strong and weak definitions.
Case 1: The strong definition has an annotated section name,
like .init.text. Only the weak definition will be placed into
.text.foo. But since the section has no symbols, there will be no
"hole" in the section.

Case 2: Both sections are without an annotated section name.
Both will be placed into .text.foo section, but there will be only one
symbol (the strong one). If the weak code is before the strong code,
there is no "hole" as it fails to find the right-most symbol before
the offset.

The fix is to use the first node to compute the hole if hole.sym
is empty. If there is no symbol in the section, the first node
will be NULL, in which case, -1 is returned to skip the whole
section.

Co-developed-by: Han Shen <shenhan@google.com>
Signed-off-by: Han Shen <shenhan@google.com>
Signed-off-by: Rong Xu <xur@google.com>
Suggested-by: Sriraman Tallam <tmsriram@google.com>
Suggested-by: Krzysztof Pszeniczny <kpszeniczny@google.com>
Tested-by: Yonghong Song <yonghong.song@linux.dev>
---
 tools/objtool/elf.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/tools/objtool/elf.c b/tools/objtool/elf.c
index 3d27983dc908..6f64d611faea 100644
--- a/tools/objtool/elf.c
+++ b/tools/objtool/elf.c
@@ -224,12 +224,17 @@ int find_symbol_hole_containing(const struct section *sec, unsigned long offset)
 	if (n)
 		return 0; /* not a hole */
 
-	/* didn't find a symbol for which @offset is after it */
-	if (!hole.sym)
-		return 0; /* not a hole */
+	/*
+	 * @offset >= sym->offset + sym->len, find symbol after it.
+	 * When hole.sym is empty, use the first node to compute the hole.
+	 * If there is no symbol in the section, the first node will be NULL,
+	 * in which case, -1 is returned to skip the whole section.
+	 */
+	if (hole.sym)
+		n = rb_next(&hole.sym->node);
+	else
+		n = rb_first_cached(&sec->symbol_tree);
 
-	/* @offset >= sym->offset + sym->len, find symbol after it */
-	n = rb_next(&hole.sym->node);
 	if (!n)
 		return -1; /* until end of address space */
 
-- 
2.47.0.105.g07ac214952-goog

