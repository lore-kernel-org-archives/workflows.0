Return-Path: <SRS0=iLUk=YE=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFB94ECE58D
	for <workflows@archiver.kernel.org>; Fri, 11 Oct 2019 21:20:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8CC4F2089F
	for <workflows@archiver.kernel.org>; Fri, 11 Oct 2019 21:20:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=networkplumber-org.20150623.gappssmtp.com header.i=@networkplumber-org.20150623.gappssmtp.com header.b="dGCIN2V4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727654AbfJKVUB (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 11 Oct 2019 17:20:01 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:43042 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726843AbfJKVUB (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 11 Oct 2019 17:20:01 -0400
Received: by mail-pg1-f193.google.com with SMTP id i32so6478384pgl.10
        for <workflows@vger.kernel.org>; Fri, 11 Oct 2019 14:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AZLLabuLg/D/DBU0yuNvSV9xxJPkozPuNRJJ0b/BsrM=;
        b=dGCIN2V4DaQ3V0jHnyqRigCotyDPlaiHeLViNr+d5HWhQVpdEz1vW1v71grVUiW1ar
         TOiN9VlW7MT9oOAJKstHTY9w1hwlrNnNeGCnxbdiOl1F2sOpzsljnrbsyte+Uh27OkCd
         awbpt/UIKEZPDMsDZFMPtACi7D7zAWPzf1U7q/JdMJ5iU67qoXl8/LweAR4g3k0tZO5h
         pPzkmXthOzeK8I7wMPWMXgncQzO2lDk9LhiVQx6mnrjbI80ghet0AJlF+PhQ0YCeMZeF
         ypWC8ZNNuir2N0v+Oo0Lf+Vhy7WIqIwU4c1kc3hB9CnGNNfGab3s5OSTF1DfQNZfXnSl
         B3vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AZLLabuLg/D/DBU0yuNvSV9xxJPkozPuNRJJ0b/BsrM=;
        b=ItUmRguAAacM9Wugs60TvSdzv4ub41ERLdGoZ+JaIkCr5YtjSEYxoWxyXrnRWxuqTG
         R+rUn3pJlqKdQobhEp0k4pKuYRy+R0kiA60OhpIzDdn60v9q2lzdVY/YmMU8Cgw94RvA
         oL7kHaYEaGazeguphu2bBr9XRtNsmUya1WsMY5cCnEGbIZXyIKbupbvlCFupYew63uQg
         FxGG2/I6rKr5ZcPEBIoZMvzIHjwaoWdbloSzqFoVcXMjEXlenfGvZIZsNWK5bEeLRYZp
         5OvuDzqMdIMv85ON0dPZzZcUrK9LsCCf8/BgtuB52hmM4wmwdbH3OjFEbfEl2lelIp1R
         yoUA==
X-Gm-Message-State: APjAAAVMrHwFnhEq2Wt5rcXCuBzJZIsDn6vIz3/8Aaez89wV02AwYkIM
        0burJ9b5cb9Pc3dGrYpPk9iKuv1cMS0M9g==
X-Google-Smtp-Source: APXvYqzl5IeccSoFA2FF2JLdMQ2oUUcbfRLNsU9hRRzmEr33Z6Vyfobr+O78Xq42pFnpAsq4EVO4YA==
X-Received: by 2002:a17:90a:fb92:: with SMTP id cp18mr20485309pjb.2.1570828799445;
        Fri, 11 Oct 2019 14:19:59 -0700 (PDT)
Received: from hermes.lan (204-195-22-127.wavecable.com. [204.195.22.127])
        by smtp.gmail.com with ESMTPSA id n66sm15965570pfn.90.2019.10.11.14.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2019 14:19:59 -0700 (PDT)
Date:   Fri, 11 Oct 2019 14:19:09 -0700
From:   Stephen Hemminger <stephen@networkplumber.org>
To:     David Miller <davem@davemloft.net>
Cc:     mchehab@kernel.org, rostedt@goodmis.org, skhan@linuxfoundation.org,
        gregkh@linuxfoundation.org, patchwork@lists.ozlabs.org,
        workflows@vger.kernel.org
Subject: Re: RFE: use patchwork to submit a patch
Message-ID: <20191011141909.1ccb58b3@hermes.lan>
In-Reply-To: <20191011.121153.1410013220730418292.davem@davemloft.net>
References: <20191011140108.589bbb52@gandalf.local.home>
        <20191011.113254.1964556815296845399.davem@davemloft.net>
        <20191011155949.145f0f7d@coco.lan>
        <20191011.121153.1410013220730418292.davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Fri, 11 Oct 2019 12:11:53 -0700 (PDT)
David Miller <davem@davemloft.net> wrote:

> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> Date: Fri, 11 Oct 2019 15:59:49 -0300
> 
> > I can't see how just adding a web interface like github/gitlab
> > would solve any of the above. I mean, the submitter will still
> > need to write a proper subject/description before submitting the
> > patch to the web interface, add the tags, etc.   
> 
> You can actually codify the various fields into a web form with
> help texts etc.
> 
> Things that are mandatory can even be marked required and people
> can't even submit a PR without Signed-off-by: for example.

As someone who has to deal with a corporate busted mail server.
I agree mailing patches is a barrier to entry for many people today.
