Return-Path: <SRS0=cg+L=YI=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE93AECE588
	for <workflows@archiver.kernel.org>; Tue, 15 Oct 2019 17:24:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8763A20650
	for <workflows@archiver.kernel.org>; Tue, 15 Oct 2019 17:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1571160292;
	bh=qTk8RUlc2UuJZERxh18I8YOAu4Aueqhks5t2FEPy2vQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=u+716fjk8wcduOLl/dWV0xTVge5+1TfPIDMHT+nKfT6j+FpAR6ZqP79qYtvztOnM9
	 6XOXarkCywCRdNqEjy2lKuRJbSmPEwxItoCbZAjpXoEK5XQo7Fbv3YFYAOZ4WRRoXG
	 JrNA1BqdoynDPrWaUcHpzliAPG2P00ut78r8mw5k=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730785AbfJORYw (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 15 Oct 2019 13:24:52 -0400
Received: from mail-qt1-f169.google.com ([209.85.160.169]:33017 "EHLO
        mail-qt1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727242AbfJORYw (ORCPT
        <rfc822;workflows@vger.kernel.org>); Tue, 15 Oct 2019 13:24:52 -0400
Received: by mail-qt1-f169.google.com with SMTP id r5so31769906qtd.0
        for <workflows@vger.kernel.org>; Tue, 15 Oct 2019 10:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=2lZwPkdKDSt8x/AGZUjJLyL0AEyT0vKkly0lyLAWfps=;
        b=YGYrN5mahDwLwgfEVwKnB+3j3JlQ5X2dPrYPKFzB3RPEly2uBsfisDNMIPTOogvRiT
         jMLd0OkjIOFFEhFSH41IIwc6N2REEwNfnkqRplLbyVYdeyBI9hW2PjkD174BpK4puv0O
         bPGyYHBNsL4egfDNdERegTTSD0MfBsXqegGx8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=2lZwPkdKDSt8x/AGZUjJLyL0AEyT0vKkly0lyLAWfps=;
        b=JFGlcdvxlsjHQqt9zKXFOspoO3A/CZowhIRMkNb02d2q20c1/3x/rXEL2xCLUXNfXE
         DqHkvSxygXjfTcMiKyrz6Iz7NXlOMbxzld9nAH+ch93sCsLhDwEJJeAn4FNKj4KoPt2P
         oDrfI1sYOEllb5UW1ras0VvfspwBSWJvD1ysj5y/fKNLuem0wzanObjfKerrfM0PjO2v
         EtsE816xYMuB6XoW/LxlUvhsnu6SJB9dapsj9MOyLBOXE9w+3+ZZeRyFh0wgfkcwWgmh
         WFbE4EPP3zaZ3P+2OI6o0sAVRZ37CJDr7ye/ln2ozbbZZBHkWhuyH49n/tqbMD3AYHnA
         prvw==
X-Gm-Message-State: APjAAAWc7XUjbzLF+laB+lfSMAZB5P756aOGT8PLR4hTjvnRwHxML0Ui
        2efhScPGcDOW48apnl86oh+Zhw==
X-Google-Smtp-Source: APXvYqwwtazauzjb3qchJB7JuKVZUaADg06X42R/tfKB/Jju3DZF85hYjKqB5zQx2YrfpB51RpUZPg==
X-Received: by 2002:ac8:3f66:: with SMTP id w35mr39796391qtk.382.1571160291001;
        Tue, 15 Oct 2019 10:24:51 -0700 (PDT)
Received: from chatter.i7.local (192-0-228-88.cpe.teksavvy.com. [192.0.228.88])
        by smtp.gmail.com with ESMTPSA id l23sm16992147qta.53.2019.10.15.10.24.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2019 10:24:49 -0700 (PDT)
Date:   Tue, 15 Oct 2019 13:24:47 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Eric Wong <e@80x24.org>, Greg KH <gregkh@linuxfoundation.org>,
        patchwork@lists.ozlabs.org, workflows@vger.kernel.org
Subject: Re: RFE: use patchwork to submit a patch
Message-ID: <20191015172447.GA5473@chatter.i7.local>
Mail-Followup-To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Eric Wong <e@80x24.org>, Greg KH <gregkh@linuxfoundation.org>,
        patchwork@lists.ozlabs.org, workflows@vger.kernel.org
References: <20191010144150.hqiosvwolm3lmzp5@chatter.i7.local>
 <20191011085702.GB1075470@kroah.com>
 <20191011200228.zuka44ve7hob4ia4@chatter.i7.local>
 <20191011212308.xk7xcvfamwnkwovn@dcvr>
 <20191011213553.g3pleurh5uomumi7@chatter.i7.local>
 <20191014153333.GB23442@pendragon.ideasonboard.com>
 <20191015154010.GC11491@chatter.i7.local>
 <20191015163241.GI4875@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20191015163241.GI4875@pendragon.ideasonboard.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Tue, Oct 15, 2019 at 07:32:41PM +0300, Laurent Pinchart wrote:
>> Well, this is largely what GitGitGadget does
>> (https://gitgitgadget.github.io), and we could go that route, sure. I'm
>> reluctant only because, quoth:
>>
>>   GitGitGadget itself is a GitHub App that is backed by an Azure
>>   Function written in pure Javascript which in turn triggers an Azure
>>   Pipeline written in Typescript (which is really easy to understand and
>>   write for everybody who knows even just a little Javascript),
>>   maintained at https://github.com/gitgitgadget/gitgitgadget.
>>
>> I have zero familiarity with any of the above. That said, we do have a
>> bunch of CI engineers working at the LF, and I can probably avail myself
>> of their expertise if we decide to set this up.
>
>I certainly wouldn't recommend a solution based on a proprietary
>closed-source stack :-) But as we're talking about performing new
>development for patchwork, I wanted to point out that we could also
>consider a different technical approach that would involve new
>development for a different open-source project. For instance, is the
>above idea something that could be developed on top of gitolite ? Or
>possibly even as a tiny standalone git server ?

I wouldn't do it on top of gitolite, because the administrative overhead 
would be too large. It certainly can be done as a separate service -- 
after all, any relation between this tool and patchwork is pretty 
tenuous.

That said, I'm leaning towards shelving this idea for the moment, at 
least as an official service provided by kernel.org -- it is easier to 
limit the scope at first and target maintainer tools and communication 
frameworks. It seems that sr.ht folks are already making something like 
this available, so we can just sit on our hands for a bit and see where 
this takes us.

-K
