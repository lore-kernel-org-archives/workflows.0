Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415D21D0DCA
	for <workflows@vger.kernel.org>; Thu, 10 Oct 2024 19:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728588254; cv=none; b=ql0fhq5Pf6SQz2BCn+abL7iJ1Hy6AA3scLpx8ktnPCx8QhARXQGnQWtmqQTpd3v75DM0oW7+Pwto9f09pV7S48aEuUe5knwEuY8G6SBNteP+tejaA81PoBSXoDiSbz1OV8CpRccMI8soO4JgJAy8EB+Am71oAFZlLcg/HqcQ6dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728588254; c=relaxed/simple;
	bh=LqcsOVQmv5GpC5shRDpw1q19kzqKid+XE2EfW/9oI3s=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=S/EHASftCAZbgZQJRosNhVK8bBvzX4zIdjFhUE0hZ5BawQnRlJGIvGEVTve5vB2ADxwsQsbgF2OrFIZGytRL1v0Xv1l1lHbekZX1phKyPzhk4oD9rjTj0g/hFyLdf7UewuWQZzLMJhR6JYyyatleZHFehQa870h4uFZeCfDAnho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UV8mHI9k; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UV8mHI9k"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6d9e31e66eeso27978057b3.1
        for <workflows@vger.kernel.org>; Thu, 10 Oct 2024 12:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728588251; x=1729193051; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3BOqTSYvoekh3ysMWFRZqW1diZJBhOLc/W4rCwg+Ukg=;
        b=UV8mHI9kyjtUFrXS3BNmZ17sfu7X2IK5Ot50foKxp75pzrC9SJACTptnlCLRKZ6Zkx
         UIMD9toG0hcWAddEHT/sE0c1Bg3YgG3nvfb1+u1szGlFnR/1fImL/hXgJ5gYulmku9WZ
         aQwTlwE24yl0vCpWh3gM0ZQOFSXytZigMAJ//iEcMQJS/1+piF1UE8A2rooFG3tG4g3H
         tQHTmDFDUCZzz9RIyvDF87Up+AhmZVuTRKzTBbrWWlykpvcORivzMV+ZMOyHKuWGmuIM
         MS4B7MgWHPI/HGDy6g12CMv2vthKO183UR4LpxM0SBS0xhEt9QU989EHM2Qs7t7qcPRs
         GkSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728588251; x=1729193051;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3BOqTSYvoekh3ysMWFRZqW1diZJBhOLc/W4rCwg+Ukg=;
        b=A/YEdZcJMm/zq4tUllGfOQIbB4xdFox0C9Po2MJd61uaRb6hmb6ySKRLzAqdZ6/0O0
         Isez3mjb/R4us/GqoXc+vnnGE8JunO6KQqwQo3S9TyvDPIePAGR2z6Ex60QQ3xeDyMwL
         W0HrPEk0oASsPaguUsfNTYRw2L5A+0zJQADHS5FJVBH1ivr0bgpUDIZ5g1wTWOUPbIOw
         +YSEiASSjd06im23eS0Yl0YYeNlx7xt94VfZDvDsDBpBKCv8YJ7I98C4opLqJcDMUG3n
         5Vo0ZMOfFtNrgq7S696wWu9La1EqKa4yAt0538W9Hdma1BAHp83+0G9CJ46l6k7sBFB8
         G24Q==
X-Forwarded-Encrypted: i=1; AJvYcCVo4oc6ZzdKo3r5k+nK0My5fPpcAbPuzFZMO6rx9GDuSw0ZpzWq5fjvcf0OED+tIyjfELwcuTgmxbg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzr3MyA0xJhBHAmdVgtZM81qFZEZH5LKjcobCLB7xI1hos8gRAS
	I1HzckjRzhJj/KbJ3+vQfA8BcZnjbUHblfHBn4xF33N7q14x1xmLulmEneeJ9JPSjQ==
X-Google-Smtp-Source: AGHT+IHEhJDc7jYHTPhzM4J4p0+oM2iW7zVVsM3E55tbL5mucatmOoOEuvmUjkSCKz7r7tlVC7+ixFs=
X-Received: from xur.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:2330])
 (user=xur job=sendgmr) by 2002:a81:b04d:0:b0:6e3:2693:ca6b with SMTP id
 00721157ae682-6e32693d36bmr176997b3.2.1728588250242; Thu, 10 Oct 2024
 12:24:10 -0700 (PDT)
Date: Thu, 10 Oct 2024 12:23:55 -0700
In-Reply-To: <20241010192400.451187-1-xur@google.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241010192400.451187-1-xur@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010192400.451187-4-xur@google.com>
Subject: [PATCH v3 3/6] Change the symbols order when --ffuntion-sections is enabled
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
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Maksim Panchenko <max4bolt@gmail.com>
Cc: x86@kernel.org, linux-arch@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Sriraman Tallam <tmsriram@google.com>, 
	Krzysztof Pszeniczny <kpszeniczny@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

When the -ffunction-sections compiler option is enabled, each function
is placed in a separate section named .text.function_name rather than
putting all functions in a single .text section.

However, using -function-sections can cause problems with the
linker script. The comments included in include/asm-generic/vmlinux.lds.h
note these issues.:
  =E2=80=9CTEXT_MAIN here will match .text.fixup and .text.unlikely if dead
   code elimination is enabled, so these sections should be converted
   to use ".." first.=E2=80=9D

It is unclear whether there is a straightforward method for converting
a suffix to "..". This patch modifies the order of subsections within the
text output section when the -ffunction-sections flag is enabled.
Specifically, it repositions sections with certain fixed patterns (for
example .text.unlikely) before TEXT_MAIN, ensuring that they are grouped
and matched together.

Note that the limitation arises because the linker script employs glob
patterns instead of regular expressions for string matching. While there
is a method to maintain the current order using complex patterns, this
significantly complicates the pattern and increases the likelihood of
errors.

Co-developed-by: Han Shen <shenhan@google.com>
Signed-off-by: Han Shen <shenhan@google.com>
Signed-off-by: Rong Xu <xur@google.com>
Suggested-by: Sriraman Tallam <tmsriram@google.com>
Suggested-by: Krzysztof Pszeniczny <kpszeniczny@google.com>
---
 include/asm-generic/vmlinux.lds.h | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinu=
x.lds.h
index eeadbaeccf88..5df589c60401 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -554,9 +554,21 @@
  * during second ld run in second ld pass when generating System.map
  *
  * TEXT_MAIN here will match .text.fixup and .text.unlikely if dead
- * code elimination is enabled, so these sections should be converted
- * to use ".." first.
+ * code elimination or function-section is enabled. Match these symbols
+ * first when in these builds.
  */
+#if defined(CONFIG_LD_DEAD_CODE_DATA_ELIMINATION) || defined(CONFIG_LTO_CL=
ANG)
+#define TEXT_TEXT							\
+		ALIGN_FUNCTION();					\
+		*(.text.asan.* .text.tsan.*)				\
+		*(.text.unknown .text.unknown.*)			\
+		*(.text.unlikely .text.unlikely.*)			\
+		. =3D ALIGN(PAGE_SIZE);					\
+		*(.text.hot .text.hot.*)				\
+		*(TEXT_MAIN .text.fixup)				\
+		NOINSTR_TEXT						\
+		*(.ref.text)
+#else
 #define TEXT_TEXT							\
 		ALIGN_FUNCTION();					\
 		*(.text.hot .text.hot.*)				\
@@ -566,6 +578,7 @@
 		NOINSTR_TEXT						\
 		*(.ref.text)						\
 		*(.text.asan.* .text.tsan.*)
+#endif
=20
=20
 /* sched.text is aling to function alignment to secure we have same
--=20
2.47.0.rc1.288.g06298d1525-goog

