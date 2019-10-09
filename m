Return-Path: <SRS0=9qbL=YC=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 475D2C47404
	for <workflows@archiver.kernel.org>; Wed,  9 Oct 2019 23:56:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1A32221019
	for <workflows@archiver.kernel.org>; Wed,  9 Oct 2019 23:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1570665397;
	bh=BVd6fn8P6YrHosd/PfAZZHRZ0ezEwlv906C9Q1BEVSg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=rEDqgM0FWSbgFemSOGhikPgwI8hS+3J68Xp9H+HN1rjKDomRpJ8x6fPTR44iJxcnf
	 aehus1RQNxI3Z4/nBBr8CR/qPPSRunrEI+cMszdumDL1QygsdRAqESrVn+aFwbYWuv
	 YE5OfEG4Xl8Kvw6mPyVAVLRYdqTWdGvdthKRSN+c=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732017AbfJIX4g (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 9 Oct 2019 19:56:36 -0400
Received: from mail-qt1-f174.google.com ([209.85.160.174]:47005 "EHLO
        mail-qt1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730815AbfJIX4g (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 9 Oct 2019 19:56:36 -0400
Received: by mail-qt1-f174.google.com with SMTP id u22so6017245qtq.13
        for <workflows@vger.kernel.org>; Wed, 09 Oct 2019 16:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=xgKttaTeGNDiCEVRLB6vadU/bWB0WTT3IytI1yxfnJQ=;
        b=H3pi02mWgeJFQRW8u1N+kpeX7PVjkcipRDNHPECCJwZlQC9HTpEE2iWJziHp0wU9v/
         4+8dDMiiCVNZOR/Meqd9QLSuxvb+UJbisQf3eJV1n2Iys6XRiiIrqBW2An5ZA9h0Ddsj
         8qI65bd8TxkexBgSvc9dQJg2jOsaDSCFGAM44=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=xgKttaTeGNDiCEVRLB6vadU/bWB0WTT3IytI1yxfnJQ=;
        b=drzzM0WOCU+GQcDg7cktUsG/sDIMOJppyBdAosrqPBhYVHz3dTVWRoYzqm80UeYpwN
         tij2GibzNmA7aRLxQQetXDJHd0bccR3xAYAcl/9/E8whUbIkn/XGSOSB1axO6gjt8FKN
         xp74MFMlp5An4HOrh4SXgUu/0Prg/rdeBoJL3YkWPxl1oRSzOuvXvepOVOcFD04b3M/6
         QbnBXp0AdBofIVj3dVazxAgCtU5NcDuO/+p0XSz9NwPptjj+SSOxBXdzXwgmFKkur9wY
         6V8YYNB/n2l8gm5UBzJO8tcy6mbx9Ud+WJfi4lj2BmDNGrbEURsQgefdgFjGeufP+dy/
         Y0qw==
X-Gm-Message-State: APjAAAW12McK5abgS6dgSownx/7PjGSxBaaE57J7To9jHYF7Epsemkl/
        qemon1vqo4QlBnXm+8kqCuX/ug==
X-Google-Smtp-Source: APXvYqwoTWKh7B0uxdjGPAo5flbI1ofLFGrVMcPr+At2G5pGTbMPV3tJQQ+Oas1lT5/TC1QnMPedpQ==
X-Received: by 2002:ac8:237b:: with SMTP id b56mr7038817qtb.264.1570665394957;
        Wed, 09 Oct 2019 16:56:34 -0700 (PDT)
Received: from pure.paranoia.local ([87.101.92.157])
        by smtp.gmail.com with ESMTPSA id v7sm1623290qte.29.2019.10.09.16.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2019 16:56:34 -0700 (PDT)
Date:   Wed, 9 Oct 2019 19:56:31 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Eric Wong <e@80x24.org>
Cc:     Laura Abbott <labbott@redhat.com>, Don Zickus <dzickus@redhat.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Daniel Axtens <dja@axtens.net>,
        David Miller <davem@davemloft.net>, sir@cmpwn.com,
        nhorman@tuxdriver.com, workflows@vger.kernel.org
Subject: Re: thoughts on a Merge Request based development workflow
Message-ID: <20191009235631.hhkbxoiqgzyypcer@pure.paranoia.local>
References: <20191007.173329.2182256975398971437.davem@davemloft.net>
 <87zhicqhzg.fsf@dja-thinkpad.axtens.net>
 <20191007211704.6b555bb1@oasis.local.home>
 <20191008164309.mddbouqmbqipx2sx@redhat.com>
 <20191008131730.4da4c9c5@gandalf.local.home>
 <20191008173902.jbkzrqrwg43szgyz@redhat.com>
 <20191008190527.hprv53vhzvrvdnhm@chatter.i7.local>
 <bbf9d038-2238-b97f-7cae-97804ee1624c@redhat.com>
 <20191009215416.o2cw6cns3xx3ampl@chatter.i7.local>
 <20191009222156.nedvmajswb3w3r3c@dcvr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191009222156.nedvmajswb3w3r3c@dcvr>
User-Agent: NeoMutt/20180716
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Wed, Oct 09, 2019 at 10:21:56PM +0000, Eric Wong wrote:
> One of my long-term visions is to have an agreed upon way to
> have entirely forkable development communities.  Git already
> gave us forkable code repositories.

FYI, this does already exist in the form of Fossil:
https://www.fossil-scm.org/home/doc/trunk/www/index.wiki

The main reason why we can't really consider it is because it requires
moving away from git, which is a non-starter for anyone.

-K
