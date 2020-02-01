Return-Path: <SRS0=hXFv=3V=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C6DCC33CB2
	for <workflows@archiver.kernel.org>; Sat,  1 Feb 2020 03:01:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 55DC720663
	for <workflows@archiver.kernel.org>; Sat,  1 Feb 2020 03:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1580526070;
	bh=9GOoXNh9cJh0f7rWEYj5+/u0puiZ9m6J4rXMsqHw0X8=;
	h=Date:From:To:Subject:List-ID:From;
	b=G+ty97+sOkjUaHDit+m6nnCuqUEvCOhQVBn2OW3ejFcx5eXXyKhX6aKs+CUyKbani
	 MyoiNYmAOYl+e2Uh2D1zsB2VYVjsE0CSE1YfBHQEc3Mym4IgmpE6YF68bMZM+1FeFa
	 aMCvm4LkHoEYkvi5QalX9FlvlQhII2oErgtzzXjE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726561AbgBADBJ (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 31 Jan 2020 22:01:09 -0500
Received: from mail-qv1-f52.google.com ([209.85.219.52]:39321 "EHLO
        mail-qv1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726548AbgBADBJ (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 31 Jan 2020 22:01:09 -0500
Received: by mail-qv1-f52.google.com with SMTP id y8so4258300qvk.6
        for <workflows@vger.kernel.org>; Fri, 31 Jan 2020 19:01:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:subject:message-id:mail-followup-to:mime-version
         :content-disposition;
        bh=rCs28FzKKoPZ68H1HxAXk2aW8bjC6JbUm8WHSuCwC6w=;
        b=dvZngzim3O0RbgJB4Yc5tiyjyuvpruYh0bYhQuBU4gmWUWnjjs08QmR8QIwoT30kbG
         0AA9O6VmTDphw9b57J1eQRsKV4uu+INLAj3epRRdTiV7CM9IttVPreMmY+5MMenvJlLi
         tZPVPNs0/AhQAhJaIhKP2SP2ZKcR0/emClD8o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
         :mime-version:content-disposition;
        bh=rCs28FzKKoPZ68H1HxAXk2aW8bjC6JbUm8WHSuCwC6w=;
        b=QtFFdv5K4sw24gKd8cLbert7tG+EZApZBzjbEF786C9Ihuy8Xn9BwUQEu3RZoYsmza
         kF2dBFlb+Z8M/c+IS3ETZmRcG3ahd50c0voYuY4JBB2TWbZ8AygJjORcUr4lOyUxa6vd
         62VAaTERHE4ZT3pmsDmocyF6/XCKmgrEYWjzUsa/cb3Bb90w405bACEA3VrF31am/MQo
         wvGhCpdVCcCMmcF+6jBJm2aOF3nxu848+ivygt0lASDI+55is4RMZIKCHxzzWA973qc2
         gGGN2+NjlCaozCo2eFKoaYOGsA6oo8GmuuXB8EdAWhuCofAEivQ9BtPb8xSX89LGlZRB
         SnfA==
X-Gm-Message-State: APjAAAUyJ2EkAfAU9y3URe0Sw3imjM5+kjjF5b/MlrjxUOHVr8KyNa/m
        6v1oVQWwYDrynEuJ79B0F5pirULxOr1kgNqv
X-Google-Smtp-Source: APXvYqxogSdUaR5SZ2DkIRlOmP+c4qaTdL37aztK/gF1bI6mm2wbD0E3m8QIGKMjpbP8DjQvTGPuVA==
X-Received: by 2002:ad4:446b:: with SMTP id s11mr13328958qvt.148.1580526067818;
        Fri, 31 Jan 2020 19:01:07 -0800 (PST)
Received: from chatter.i7.local (107-179-243-71.cpe.teksavvy.com. [107.179.243.71])
        by smtp.gmail.com with ESMTPSA id s42sm6051785qtk.87.2020.01.31.19.01.06
        for <workflows@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2020 19:01:07 -0800 (PST)
Date:   Fri, 31 Jan 2020 22:01:05 -0500
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     workflows@vger.kernel.org
Subject: get-lore-mbox: quickly grab full threads from lore
Message-ID: <20200201030105.k6akvbjpmlpcuiky@chatter.i7.local>
Mail-Followup-To: workflows@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Hi, all:

I'd like your opinion on this quick helper script I wrote that uses any 
message-id to grab a full thread from lore.kernel.org and save it as a 
mbox file.

What's more useful, it can also prepare a mbox that you can pass 
straight to git-am:

- it will tally up all "Acked-by", "Reviewed-by" etc trailers and add 
  them to the proper patch headers
- it will properly sort patches in the series, so you don't have to do 
  it manually

Examples:

Just get the mbox file, in case you got cc'd somewhere in the middle and 
want to view the whole context:

  $ ./get-lore-mbox.py -o/tmp 20200128184934.77625-1-samitolvanen@google.com
  Looking up https://lore.kernel.org/r/20200128184934.77625-1-samitolvanen@google.com
  Grabbing thread from https://lore.kernel.org/kernel-hardening/20200128184934.77625-1-samitolvanen@google.com/t.mbox.gz
  Saved thread into /tmp/20200128184934.77625-1-samitolvanen@google.com.t.mbx
  $ mutt -f /tmp/20200128184934.77625-1-samitolvanen@google.com.t.mbx

Now let's pass '--am-ready/-a' to get the same thing but in a format 
that's ready to be consumed by "git am":

  $ ./get-lore-mbox.py -o/tmp -a 20200128184934.77625-1-samitolvanen@google.com
  Looking up https://lore.kernel.org/r/20200128184934.77625-1-samitolvanen@google.com
  Grabbing thread from https://lore.kernel.org/kernel-hardening/20200128184934.77625-1-samitolvanen@google.com/t.mbox.gz
  Saved thread into /tmp/20200128184934.77625-1-samitolvanen@google.com.t.mbx
  Analyzing 280 messages in the thread
	Processing: [PATCH 00/18] add support for Clang's Shadow Call Stack
	Processing: [PATCH 01/18] arm64: mm: don't use x18 in idmap_kpti_install_ng_mappings
  ...
  Found new series version: v2
    Processing: [PATCH v2 00/17] add support for Clang's Shadow Call Stack
    Processing: [PATCH v2 02/17] arm64/lib: copy_page: avoid x18 register in assembler code
  ...
  Found new series version: v7
	Processing: [PATCH v7 00/11] add support for Clang's Shadow Call Stack
	Processing: [PATCH v7 01/11] add support for Clang's Shadow Call Stack (SCS)
  ---
  Writing /tmp/v7_add_support_for_clang_s_shadow_call_stack.mbx
	[PATCH v7 00/11] add support for Clang's Shadow Call Stack
	[PATCH v7 01/11] add support for Clang's Shadow Call Stack (SCS)
	[PATCH v7 02/11] scs: add accounting
	[PATCH v7 03/11] scs: add support for stack usage debugging
	[PATCH v7 04/11] scs: disable when function graph tracing is enabled
	  Adding trailer: Reviewed-by: Kees Cook <keescook@chromium.org>
	[PATCH v7 05/11] arm64: reserve x18 from general allocation with SCS
	[PATCH v7 06/11] arm64: preserve x18 when CPU is suspended
	[PATCH v7 07/11] arm64: efi: restore x18 if it was corrupted
	[PATCH v7 08/11] arm64: vdso: disable Shadow Call Stack
	[PATCH v7 09/11] arm64: disable SCS for hypervisor code
	[PATCH v7 10/11] arm64: implement Shadow Call Stack
	[PATCH v7 11/11] arm64: scs: add shadow stacks for SDEI
  ---
  Link: https://lore.kernel.org/r/20200128184934.77625-1-samitolvanen@google.com
  Base-commit included, you can branch using:
	git checkout -b v7_add_support_for_clang_s_shadow_call_stack b0be0eff1a5ab77d588b76bd8b1c92d5d17b3f73
	git am /tmp/v7_add_support_for_clang_s_shadow_call_stack.mbx

You'll see that it's properly version-aware and will get you the latest 
series version (once it gets to it). Since the series properly includes 
the 'base-commit' information, it will also handily give you the git 
command to use to branch from that parent.

If you want an earlier version of that series, you can specify it with a 
-v flag:

  $ ./get-lore-mbox.py -o/tmp -a -v6 20200128184934.77625-1-samitolvanen@google.com
  Looking up https://lore.kernel.org/r/20200128184934.77625-1-samitolvanen@google.com
  Grabbing thread from https://lore.kernel.org/kernel-hardening/20200128184934.77625-1-samitolvanen@google.com/t.mbox.gz
  Saved thread into /tmp/20200128184934.77625-1-samitolvanen@google.com.t.mbx
  Analyzing 280 messages in the thread
	Ignoring v1: [PATCH 00/18] add support for Clang's Shadow Call Stack
	Ignoring v1: [PATCH 01/18] arm64: mm: don't use x18 in idmap_kpti_install_ng_mappings
    ...
	Ignoring v5: Re: [PATCH v5 14/14] arm64: implement Shadow Call Stack
  Found new series version: v6
	Processing: [PATCH v6 00/15] add support for Clang's Shadow Call Stack
	Processing: [PATCH v6 01/15] arm64: mm: avoid x18 in idmap_kpti_install_ng_mappings
    ...
	Processing: Re: [PATCH v6 14/15] arm64: implement Shadow Call Stack
  Found new series version: v7
	Ignoring v7: [PATCH v7 00/11] add support for Clang's Shadow Call Stack
	Ignoring v7: [PATCH v7 01/11] add support for Clang's Shadow Call Stack (SCS)
    ...
	Ignoring v7: Re: [PATCH v7 04/11] scs: disable when function graph tracing is enabled
  ---
  Writing /tmp/v6_add_support_for_clang_s_shadow_call_stack.mbx
	[PATCH v6 00/15] add support for Clang's Shadow Call Stack
	[PATCH v6 01/15] arm64: mm: avoid x18 in idmap_kpti_install_ng_mappings
	[PATCH v6 02/15] arm64/lib: copy_page: avoid x18 register in assembler code
	[PATCH v6 03/15] arm64: kvm: stop treating register x18 as caller save
	[PATCH v6 04/15] arm64: kernel: avoid x18 in __cpu_soft_restart
	[PATCH v6 05/15] add support for Clang's Shadow Call Stack (SCS)
	[PATCH v6 06/15] scs: add accounting
	[PATCH v6 07/15] scs: add support for stack usage debugging
	[PATCH v6 08/15] arm64: disable function graph tracing with SCS
	[PATCH v6 09/15] arm64: reserve x18 from general allocation with SCS
	  Adding trailer: Acked-by: Will Deacon <will@kernel.org>
	[PATCH v6 10/15] arm64: preserve x18 when CPU is suspended
	  Adding trailer: Acked-by: Will Deacon <will@kernel.org>
	[PATCH v6 11/15] arm64: efi: restore x18 if it was corrupted
	[PATCH v6 12/15] arm64: vdso: disable Shadow Call Stack
	[PATCH v6 13/15] arm64: disable SCS for hypervisor code
	[PATCH v6 14/15] arm64: implement Shadow Call Stack
	[PATCH v6 15/15] arm64: scs: add shadow stacks for SDEI
  ---
  Link: https://lore.kernel.org/r/20191206221351.38241-1-samitolvanen@google.com
  Base-commit included, you can branch using:
	git checkout -b v6_add_support_for_clang_s_shadow_call_stack 3cf2890f29ab6fe491361761df558ef9191cb468
	git am /tmp/v6_add_support_for_clang_s_shadow_call_stack.mbx

You can see that the git command it gives you has a different branch and 
parent info, which should let you do an easy diff between two branches, 
one using v6, and the other using v7 versions.
 
Please give it a try and let me know your feedback! You can find it here:
https://git.kernel.org/pub/scm/linux/kernel/git/mricon/korg-helpers.git/tree/get-lore-mbox.py

It's a bit raw around the edges and I keep finding corner-cases, so it 
would be super interesting for me to get input from people actually 
trying to use it for managing patch series.

Best,
-K
