Return-Path: <SRS0=yuFl=YD=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 216C6C10F14
	for <workflows@archiver.kernel.org>; Thu, 10 Oct 2019 19:53:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D5471214E0
	for <workflows@archiver.kernel.org>; Thu, 10 Oct 2019 19:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1570737218;
	bh=tTp6l6cNm1Xo+WxGGwKMqPxDRftrGZFrzohRqLRZJF4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=MjTc8NyADuPYnR2e+2q4YPIIQ1OGT5fluwpavcVCosZ3xrEC5OkE8pGxBMKlUpNZs
	 VogK+KocAnuVhnd3CBkAu72ORBlV2R1lu/V5OYg4LNasxQJ2Uu7WYZMQS3WAM7Cxbb
	 J8LRwBc9XuubJg0MvUalJVQyUKRqyslkMgZAsDAE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726017AbfJJTxi (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 10 Oct 2019 15:53:38 -0400
Received: from mail-qt1-f175.google.com ([209.85.160.175]:37351 "EHLO
        mail-qt1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725867AbfJJTxi (ORCPT
        <rfc822;workflows@vger.kernel.org>); Thu, 10 Oct 2019 15:53:38 -0400
Received: by mail-qt1-f175.google.com with SMTP id l51so10218640qtc.4
        for <workflows@vger.kernel.org>; Thu, 10 Oct 2019 12:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=UanhrXCFQqTjy69ystGpZ88HCo/HssMqgcb/FjevumM=;
        b=dxRl9r+oec9ZIgaMig42eYBiqZZLh2+NRGYpFeV/qJ4OI75O86HgudXuLF99+6rFfC
         cDv4h1qr6MzYoHmQcm3aS0vW6FaCRO1CMRH0KoPEcNAEN2afW+C7HrHEmMGJv6CFV3aE
         vmS0EGZyfRGTW0x+9OgDTxRab4d5Sehqg451Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=UanhrXCFQqTjy69ystGpZ88HCo/HssMqgcb/FjevumM=;
        b=QkMUmV509PWquSzyUoQri7q09KR1r2fj15OUNHj+IFkL5INuTZzV4KtnPdQrE/0JB/
         3aujxOW2XvBnGlzF+4PcB0+MD1/2A2OOqY67/FV/ki9hJRIK14SgZ57LJMKjp+2kmibt
         VMLmjWb/3UxYqBApScoveyoOEDw5bp8PQ5McBnJxpI90Ya10cnldphzT+m/4nEaIt2pu
         MfOCg8ORcWNUk9GYlMh60nPlQ/gPkOFlFt6FMcBKMCrldOsLQQTI+M8nw5U8D3R5Lms8
         qksI+N+0ccNEQUR/T4cfBRRV2fakfWjypp/32vVt9DoWChYbfD2A6yqTyrWFH5UD/pRx
         p2Og==
X-Gm-Message-State: APjAAAXCZRHL7uwBDWWzCzxQlMq2mxmSrAqNJnDRCDyQlp3Ql3bXII0D
        x6SGPQ2OadGtFCUdNkgYFXLU+Q==
X-Google-Smtp-Source: APXvYqyLLR9dHCPnz3SQlozgidSPf38p21/8go1Wi/TUZ9Cvv4SOSRN5Gh8YH7yhdEdgMXAS5yRcYg==
X-Received: by 2002:ad4:4112:: with SMTP id i18mr12160896qvp.21.1570737217100;
        Thu, 10 Oct 2019 12:53:37 -0700 (PDT)
Received: from chatter.i7.local (192-0-228-88.cpe.teksavvy.com. [192.0.228.88])
        by smtp.gmail.com with ESMTPSA id e13sm2719960qkm.110.2019.10.10.12.53.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2019 12:53:36 -0700 (PDT)
Date:   Thu, 10 Oct 2019 15:53:35 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     patchwork@lists.ozlabs.org, workflows@vger.kernel.org
Subject: Re: RFE: use patchwork to submit a patch
Message-ID: <20191010195335.fmh6atylozhehftt@chatter.i7.local>
Mail-Followup-To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        patchwork@lists.ozlabs.org, workflows@vger.kernel.org
References: <20191010144150.hqiosvwolm3lmzp5@chatter.i7.local>
 <20191010150729.1355f33d@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20191010150729.1355f33d@coco.lan>
User-Agent: NeoMutt/20180716
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Thu, Oct 10, 2019 at 03:07:29PM -0300, Mauro Carvalho Chehab wrote:
>> - the patch submission screen has a succession of screens:
>>
>>   1. a screen with a single field allowing a user to paste a URL to
>>      their fork of the git repository.
>
>This will raise the bar, as it will force all developers to have a
>public site to host the tree. I guess only a fraction of the 4k kernel
>devs have it... In special, the ones that just want to send us a patch
>fixing a bug may have serious troubles implementing that.

I don't think this will raise the bar, as Github/Gitlab allow for very 
easy forking of https://github.com/torvalds/linux. This is also not at 
all aimed at "all developers" -- only those that don't want to use the 
current CLI workflow and are more comfortable with web tools like 
Github.

>>   2. next screen asks the user to select the ref to work from using 
>>      the
>>      list obtained from the remote. Once submitted, patchwork performs a
>>      `git clone --reference` to clone the repository locally using a
>>      local fork of the same repo to minimize object transfer. This part
>>      requires that:
>>        a. patchwork project is configured with a path to a local fork,
>>           if this feature is enabled for a project
>>        b. that fork is kept current via some mechanism outside of
>>           patchwork (e.g. with grokmirror)
>>        c. there is some sanity-checking during the clone process to
>>           avoid abuse (e.g. a sane timeout, a tmpdir with limited size,
>>           etc -- other suggestions welcome)
>
>That would require a high bandwidth at the machine with as patchwork.
>Also, doesn't sound a good idea to me, as the server may end by having
>tons of open sections, most waiting for tens of minutes, in order to
>complete git clone.

This is actually really fast if you already have a local copy of the 
repository with most objects. Try this yourself if you have 
torvalds/linux.git locally:

git clone --bare -s torvalds/linux.git test
cd test
git remote add arm-soc https://git.kernel.org/pub/scm/linux/kernel/git/arm/arm-soc
git fetch arm-soc for-next

The whole process takes a second or so and the resulting repo is 328K in 
size.

Of course, this assumes that the remote repository isn't trying to do 
something nasty, which is why I suggest anti-abuse precautions.

>> I know this is a pretty big RFE, and I would like to hear your 
>> thoughts
>> about this. If there is general agreement that this is doable/good idea,
>> I may be able to come up with funding for this development as part of
>> the overall tooling improvement proposal.
>
>The procedure itself is not bad, but, if implemented, IMHO, it should,
>instead, be something that will run at the machine of the one submitting
>the patch. For instance, this could be a perl or python script inside
>Kernel's ./script directory that would handle everything locally, and
>then submit the patch via patchwork's REST API.

I think I didn't make clear that this isn't supposed to go straight to 
patchwork. Patchwork is merely a convenient tool where this happens -- 
the resulting patch gets mailed out to the mailing list just as the user 
would have done.

-K
