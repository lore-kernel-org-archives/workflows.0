Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4967CE82CAF
	for <workflows@archiver.kernel.org>; Wed, 27 Sep 2023 16:15:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230164AbjI0QPm (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 27 Sep 2023 12:15:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231682AbjI0QPf (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 27 Sep 2023 12:15:35 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD53B1BE
        for <workflows@vger.kernel.org>; Wed, 27 Sep 2023 09:15:33 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-692b2bdfce9so8763395b3a.3
        for <workflows@vger.kernel.org>; Wed, 27 Sep 2023 09:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695831333; x=1696436133; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qk/M+saCBlOrifX9o0L6oxM9T2M5RIIV6XdENJ7/hVU=;
        b=EWjJi1jqh6WTxu5oWMb4VHh6Tv+tHmmslrdt+e2SEtQ8ihfyO52L0Z+0oikG7inGG3
         9OGc6TVEDdEYrXS9w+V2wJFguqao+tfsXvWuMwz4il198ie7VFe5VB/lwaWGcdsc4nI0
         BeLI+46dJjyqE5ApjQjCeSrYsMT1oA+3GPkhg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695831333; x=1696436133;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qk/M+saCBlOrifX9o0L6oxM9T2M5RIIV6XdENJ7/hVU=;
        b=tZk9EGl7USqB+1rUadmiROn9w9HqxWU/SL/elvfXy0zyC0I1u+oGMFG5BIzy3GuW0Z
         3mwZoJQFYf9gPKhqivYrrqCBdVQNW8pWbiz79gmtBHh+MxpzC+BlvkgTife7n6KmmNZ3
         H9CvXIIP6foj3rDG5jDfp6BdS7z4pKNLcLtkFzXpjUCQZDB7k/3CiifSHmggz3CDEYMs
         r9F1Zg24X6EiFd9YPveOqDG4mBdXcs3GJpFreTVx214PQ52PTdH8m3pIxROH1AxGZiIK
         iNG6hiRBcPXc7KWhAHY8SpJez7wRUjTtHzP2fB8UBY2vT8MVD/8X+1eYde0EHu6JZC6C
         wwRA==
X-Gm-Message-State: AOJu0YyJV5ZBFp0/5Axv7/X1nN1Asqsth7QBxywQ538SZ5XHLec8r45d
        rQRNMel65QFalQGbYe2BoARluA==
X-Google-Smtp-Source: AGHT+IGEWFo3Z0KRLdbeKNA9TZxiDU0ZlL7pCm1jg2RuPiQ94pBSvnMYFSNa/cMOgbj+bsYfP7FGbg==
X-Received: by 2002:a05:6a20:ce92:b0:152:efa4:21b with SMTP id if18-20020a056a20ce9200b00152efa4021bmr2513269pzb.5.1695831333107;
        Wed, 27 Sep 2023 09:15:33 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id c14-20020aa7880e000000b0069100e70943sm11945318pfo.24.2023.09.27.09.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 09:15:32 -0700 (PDT)
Date:   Wed, 27 Sep 2023 09:15:32 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Justin Stitt <justinstitt@google.com>
Cc:     Joe Perches <joe@perches.com>, linux-kernel@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Jakub Kicinski <kuba@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        geert@linux-m68k.org, gregkh@linuxfoundation.org,
        workflows@vger.kernel.org, mario.limonciello@amd.com
Subject: Re: [PATCH 3/3] get_maintainer: add patch-only pattern matching type
Message-ID: <202309270913.911E51C@keescook>
References: <20230927-get_maintainer_add_d-v1-0-28c207229e72@google.com>
 <20230927-get_maintainer_add_d-v1-3-28c207229e72@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230927-get_maintainer_add_d-v1-3-28c207229e72@google.com>
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Wed, Sep 27, 2023 at 03:19:16AM +0000, Justin Stitt wrote:
> Add the "D:" type which behaves the same as "K:" but will only match
> content present in a patch file.
> 
> To illustrate:
> 
> Imagine this entry in MAINTAINERS:
> 
> NEW REPUBLIC
> M: Han Solo <hansolo@rebelalliance.co>
> W: https://www.jointheresistance.org
> D: \bstrncpy\b
> 
> Our maintainer, Han, will only be added to the recipients if a patch
> file is passed to get_maintainer (like what b4 does):
> $ ./scripts/get_maintainer.pl 0004-some-change.patch
> 
> If the above patch has a `strncpy` present in the subject, commit log or
> diff then Han will be to/cc'd.
> 
> However, in the event of a file from the tree given like:
> $ ./scripts/get_maintainer.pl ./lib/string.c
> 
> Han will not be noisily to/cc'd (like a K: type would in this
> circumstance)
> 
> Note that folks really shouldn't be using get_maintainer on tree files
> anyways [1].
> 
> [1]: https://lore.kernel.org/all/20230726151515.1650519-1-kuba@kernel.org/

As Greg suggested, please drop the above paragraph and link. Then this
looks good to me.

I would immediately want to send this patch too, so please feel free to
add this to your series (and I bet many other hints on "git grep 'K:.\\b'"
would want to switch from K: to D: too):

diff --git a/MAINTAINERS b/MAINTAINERS
index 5f18c6ba3c3c..830e10866acf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5057,7 +5057,7 @@ F:	Documentation/kbuild/llvm.rst
 F:	include/linux/compiler-clang.h
 F:	scripts/Makefile.clang
 F:	scripts/clang-tools/
-K:	\b(?i:clang|llvm)\b
+D:	\b(?i:clang|llvm)\b
 
 CLK API
 M:	Russell King <linux@armlinux.org.uk>
@@ -8199,7 +8199,7 @@ F:	lib/strcat_kunit.c
 F:	lib/strscpy_kunit.c
 F:	lib/test_fortify/*
 F:	scripts/test_fortify.sh
-K:	\b__NO_FORTIFY\b
+D:	\b__NO_FORTIFY\b
 
 FPGA DFL DRIVERS
 M:	Wu Hao <hao.wu@intel.com>
@@ -11457,9 +11457,9 @@ F:	include/linux/overflow.h
 F:	include/linux/randomize_kstack.h
 F:	kernel/configs/hardening.config
 F:	mm/usercopy.c
-K:	\b(add|choose)_random_kstack_offset\b
-K:	\b__check_(object_size|heap_object)\b
-K:	\b__counted_by\b
+D:	\b(add|choose)_random_kstack_offset\b
+D:	\b__check_(object_size|heap_object)\b
+D:	\b__counted_by\b
 
 KERNEL JANITORS
 L:	kernel-janitors@vger.kernel.org
@@ -17354,7 +17354,7 @@ F:	drivers/acpi/apei/erst.c
 F:	drivers/firmware/efi/efi-pstore.c
 F:	fs/pstore/
 F:	include/linux/pstore*
-K:	\b(pstore|ramoops)
+D:	\b(pstore|ramoops)
 
 PTP HARDWARE CLOCK SUPPORT
 M:	Richard Cochran <richardcochran@gmail.com>
@@ -19302,8 +19302,8 @@ F:	include/uapi/linux/seccomp.h
 F:	kernel/seccomp.c
 F:	tools/testing/selftests/kselftest_harness.h
 F:	tools/testing/selftests/seccomp/*
-K:	\bsecure_computing
-K:	\bTIF_SECCOMP\b
+D:	\bsecure_computing
+D:	\bTIF_SECCOMP\b
 
 SECURE DIGITAL HOST CONTROLLER INTERFACE (SDHCI) Broadcom BRCMSTB DRIVER
 M:	Kamal Dasu <kamal.dasu@broadcom.com>

-- 
Kees Cook
