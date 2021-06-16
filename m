Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 026FEC48BE8
	for <workflows@archiver.kernel.org>; Wed, 16 Jun 2021 18:05:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D4B9F61351
	for <workflows@archiver.kernel.org>; Wed, 16 Jun 2021 18:05:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231532AbhFPSHx (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 16 Jun 2021 14:07:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231518AbhFPSHx (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 16 Jun 2021 14:07:53 -0400
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E256BC061574
        for <workflows@vger.kernel.org>; Wed, 16 Jun 2021 11:05:46 -0700 (PDT)
Received: by mail-qk1-x72e.google.com with SMTP id q16so307815qkm.9
        for <workflows@vger.kernel.org>; Wed, 16 Jun 2021 11:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=c3+BOKsT9JklU+wBo7OpZl9GkFkrssfC/xuHj/8DH0E=;
        b=CrdqJUENhxKfaaSSR4F2MWdy9GY6AmsrMJIGbLVqKFOS9ekrROfmZ06/vbZTaZZtAF
         WkdnR/+e8Xv2lG/tPcfwIITdfFGMP0QQ9ZAURdaub8FVyhxPy9goQP8rBjWlPdtF4W5q
         qbYyZYeguf7KVulsyBo4S9JK3MA/oo4A37+ws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=c3+BOKsT9JklU+wBo7OpZl9GkFkrssfC/xuHj/8DH0E=;
        b=qdStWl2a+QQEKV61JnrcN2Ko1BF0aJypzQQ/pMlV6THvkc7IinSzRelUi346WWeCjh
         JeO3DZS02Wk9cnteiMfYRknMPgnffIp/NZ4xeY6wjsYZ0gOLUX0OzdFv3lgZ4hsdsBBX
         oMDZZkeynCGjcBehvHCBjKZgA9qAV1CGPYFJ06EbBH0Z2TF1/TwUYCW0iDiW7cBH7uix
         V2Q+jTIgJ7TDVpgbP5TcRC9DjyDRDXOEj9RGpE2LV7D5IK4hw9VZbqJPQBO9XrpCHcqB
         aR63hfxQPz/MBK25NHKA1lD+kU1Kn+LbY+GBpIcH6MW5lBrN/agwXMF4YVBk93oloUUf
         ZamQ==
X-Gm-Message-State: AOAM530ImWz5ebw7dn1+D33KZHgxIfQ2Row/SWU0EugbIqvlnWr0uDHG
        zIoGaVH8gJlyHFHH9UTeUynbFA==
X-Google-Smtp-Source: ABdhPJxLVekqwoWk77iNvz/TRL+ZBQtUtKLgk6xTMPMsOZmoe3cCLOFb63nzC1uoSk1I2pTUqqjjXw==
X-Received: by 2002:a05:620a:1299:: with SMTP id w25mr1445292qki.320.1623866746050;
        Wed, 16 Jun 2021 11:05:46 -0700 (PDT)
Received: from nitro.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id z188sm2155089qkd.68.2021.06.16.11.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 11:05:45 -0700 (PDT)
Date:   Wed, 16 Jun 2021 14:05:43 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Ido Rosen <ido@kernel.org>
Cc:     users@linux.kernel.org, workflows@vger.kernel.org
Subject: Re: RFC: Github PR bot questions
Message-ID: <20210616180543.wevddhlzq4ow22f5@nitro.local>
References: <20210616171813.bwvu6mtl4ltotf7p@nitro.local>
 <CAJhbpm_BgbSx581HU0mTCkcE28n_hRx=tv74az_mE2VBmPtrVA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJhbpm_BgbSx581HU0mTCkcE28n_hRx=tv74az_mE2VBmPtrVA@mail.gmail.com>
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Wed, Jun 16, 2021 at 10:48:59AM -0700, Ido Rosen wrote:
> I’d suggest limiting the feature set to automatically responding to GitHub
> PRs with a link to a tutorial on how to contribute patches etc.  Doing too
> much for them may create more harm than good in the long run because it
> removes the incentive to learn the contribution process.

I do understand that sentiment, to a degree; in fact, I often compare our
process to submitting a paper to a peer-reviewed journal. You can't just email
your napkin thoughts -- it must be formatted in a very specific way, list its
references in a very specific way etc, etc.

However, that is not a perfect analogy. Our code review process must also
allow for what is effectively a "report a typo" link. Currently, this is
extremely onerous for anyone, as a 15-minute affair suddenly becomes a
herculean effort. The goal of this work is to make drive-by patches easier
without also burying maintainers under a pile of junk submissions.

> An exception to this would be documentation patches and typo fixes: the
> GitHub web editor makes it very easy to edit documentation and other
> changes that don’t require compilation to test (e.g. spelling errors in
> comments, man pages, txt files, etc.).

Or it could be a tiny change in the driver string output, so I'm not sure it
makes sense to limit this to just docs (especially with many docs being
sourced straight from .c files).

-K
