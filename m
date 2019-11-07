Return-Path: <SRS0=i0oo=Y7=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CCB8C43331
	for <workflows@archiver.kernel.org>; Thu,  7 Nov 2019 20:43:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1D4BE206A3
	for <workflows@archiver.kernel.org>; Thu,  7 Nov 2019 20:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573159433;
	bh=zWQz6fAOKSr58UOAtVdeVzlIUUMOX73B6KNf56mCH3o=;
	h=Date:From:To:Subject:List-ID:From;
	b=pFNereFEN1YaXv9vCPbbWeNxwo/FEGWRymfm4KLhQqK6Lxv0M5NpRa5SzdjRBo0qp
	 HHyJRqKTxAh433AV5RfpfMqabH3LX2N4U6dOTjVydYmlf77YrY9VNjj+bqlmhLT81Q
	 WQpZlHHACbVwtynBhU89NpOiwuKFQP22kNKMjhzQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726251AbfKGUnw (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 7 Nov 2019 15:43:52 -0500
Received: from mail-qk1-f193.google.com ([209.85.222.193]:36071 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725906AbfKGUnw (ORCPT
        <rfc822;workflows@vger.kernel.org>); Thu, 7 Nov 2019 15:43:52 -0500
Received: by mail-qk1-f193.google.com with SMTP id d13so3296462qko.3
        for <workflows@vger.kernel.org>; Thu, 07 Nov 2019 12:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:subject:message-id:mail-followup-to:mime-version
         :content-disposition;
        bh=0j/x6uZI/rY54yL20eI7h8504fDarUsTwtCfIuJ2BRo=;
        b=EkFOZHjEb/KsZacUm7VV6t8hCRR8z057UdiH0BHackxyZ6MRPLwGdn+siV1N0LviQa
         SdTua9pX7i7KgBf4e2ZWTo72fVDmcHdY9KD8PPx5qcFQPUakv/9IF9H8yd+DW1JegxHH
         g6rOqUpopF7IRHzLaK8vYvg1TkmLGATDHv6lo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
         :mime-version:content-disposition;
        bh=0j/x6uZI/rY54yL20eI7h8504fDarUsTwtCfIuJ2BRo=;
        b=NY4QttbHHOO3IUSBwJuwFnVoH14msaOGdboneuedmjsyZeKfqM77PT9/GvPTFb06hR
         dVFGnK7Qj0/DudA2qYE1iQHP7d45Gs4Uub5awIrlGbh4Fe+4A3rANO3eCSxpp4arsP9S
         IRbz+J9jPi/vkhwPh3PvXtpRxx8C96y8tHh7hQjT620N5xs41rbtZQugzYG56/0UvqiC
         BOe83jdVYLnCq0rYny9GwVCAhfajmbeycQ09P0pDOh5aBPpxCk//Y8lwo6nh9jVi3oMt
         h3rgFCfk9YopJ1bQDUgmsNd3F9szLiKLb9Io43J58OUXyp1hQpFM6BQuHlyNlu8Bklnm
         JY6Q==
X-Gm-Message-State: APjAAAUnEdnBuFaVmMOTrBBFKG5rnsH7+ZJzKtoCm51Fn2jzv4Oy6iW1
        jfn5jcVkiMCa3dYZ/r1lZtne9wvcfi8haQ==
X-Google-Smtp-Source: APXvYqytTS3i6avnLzVWErelSIpcXzRYhk+r4bD2Y4z8K3sChIUnayeXvmPwPrIrOCCesVjN3NrBLg==
X-Received: by 2002:a37:9343:: with SMTP id v64mr4777752qkd.241.1573159431246;
        Thu, 07 Nov 2019 12:43:51 -0800 (PST)
Received: from chatter.i7.local (107-179-243-71.cpe.teksavvy.com. [107.179.243.71])
        by smtp.gmail.com with ESMTPSA id p3sm1564135qkf.107.2019.11.07.12.43.50
        for <workflows@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2019 12:43:50 -0800 (PST)
Date:   Thu, 7 Nov 2019 15:43:49 -0500
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     workflows@vger.kernel.org
Subject: RFC: using supersedes: trailer to indicate patch/series revision flow
Message-ID: <20191107204349.hqpefgp7cowj6hof@chatter.i7.local>
Mail-Followup-To: workflows@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Hi, all:

The only mechanism we currently have for patch/series versioning is 
subject suffixes. I think it would be useful to have a way to more 
explicitly mark that a series obsoletes a previous version, and I 
propose this is done with a `supersedes:` trailer at the end of the 
cover letter or in the first patch of the series:

E.g.:

Initial patch:

---8<---
From: Dev Eloper <dev.eloper@example.com>
Message-Id: <1572991351-86061-1-git-send-email-dev.eloper@example.com>
Subject: [PATCH] Change foo

Foo is no good. Use Bar.

Signed-off-by: Dev Eloper <dev.eloper@example.com>
---
  foo | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/foo b/foo
...

base-commit: 23fdb198ae81f47a574296dab5167c5e136a02ba
-- 
2.24.0
---8<---

Follow-up patch:

---8<---
From: Dev Eloper <dev.eloper@example.com>
Message-Id: <1572991352-86062-2-git-send-email-dev.eloper@example.com>
Subject: [PATCH,v2] Change foo

Foo is no good. Use Bar. Also use baz.

Signed-off-by: Dev Eloper <dev.eloper@example.com>
---
  foo | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/foo b/foo
...

supersedes: <1572991351-86061-1-git-send-email-dev.eloper@example.com>
base-commit: 23fdb198ae81f47a574296dab5167c5e136a02ba
-- 
2.24.0
---8<---

Questions:

1. Should this be exposed via git-format-patch flags, or just used by 
    specialized tooling?
2. Should supersedes: link to the previous version of the patch, or the 
    first ever version of the patch? I am leaning towards the latter, 
    even though in this case the message-id largely becomes identical in 
    usage to Gerrit's Change-Id.
3. Should the supersedes trailer have:
    a. message-id without brackets
    b. message-id with brackets
    c. https://lore.kernel.org/r/message-id
    My preference is b, to match with The Message-Id header usage.


-K
