Return-Path: <SRS0=iLUk=YE=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 433C9C47404
	for <workflows@archiver.kernel.org>; Fri, 11 Oct 2019 21:35:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 13ED92196E
	for <workflows@archiver.kernel.org>; Fri, 11 Oct 2019 21:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1570829757;
	bh=anGuzM/GJBNYDU5sWIYhI/JAPlfQeejUNrFi/jzjK6o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=fZloiJjkpgUzwcoMQbvL2yI4jCBAE2XhNvElJYNF5ntOtdN6yLuddTCNssoN9q0+R
	 aOa0MpIeMTvP/187vp5yD6AejqejN/0LjrT55Tul4oUGpc2ppCywhi03op84hA32tQ
	 Od1hlYm0ldMWGWJCsrzJCGHQQ7I53gRNJuqHZlYQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729223AbfJKVf4 (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 11 Oct 2019 17:35:56 -0400
Received: from mail-qk1-f169.google.com ([209.85.222.169]:35307 "EHLO
        mail-qk1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729083AbfJKVf4 (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 11 Oct 2019 17:35:56 -0400
Received: by mail-qk1-f169.google.com with SMTP id w2so10270711qkf.2
        for <workflows@vger.kernel.org>; Fri, 11 Oct 2019 14:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Epee74QarluKQWEQHHOH6IPn9EybcP5tMcywOqFq2zI=;
        b=M2CvqvlFPJe1iLp3FmxL7o40wju/yqboBPM+5y+u9TVSxKTbiF3Sqet9QcGrKOlWj5
         +4lnyT2Y0KxO4WmnaNo1j2zHPemsfDH6o6qzRxgGFmnzdxsOoocQRd5cyxJiadJ5HDdg
         KPEKMKFXiIshRSkq05XQG/CxfVWSD3sNAl3cs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=Epee74QarluKQWEQHHOH6IPn9EybcP5tMcywOqFq2zI=;
        b=A0LuoZtevahUiy/xKNRMsc5n2aRh5vbI16zvS1Ir9PHXg7BoydHS4M7/wyPit/TR/p
         rGp9EizNembHHzwkrRZOyB884KwtffhO628lytNb4OQ0snYHRLH5v8HeJDxjov31+Wqq
         JA15mV2gJvdqGKE+dfL0+QBLJLNjajbODK4FmgICVpfYgREZrYYrisuQyYxFgPptqdgA
         6543UHBp0IzmUJH0Sp8m53Sj9I3vKPPRjdcgPwgdYvSMpmOd0YjmSu6goLW+5DPEqzVN
         RKz2NkTt43oYbnZtykkIWfpoE+Y1/6dfcFjp6EvjTrmlXXprJH9axSPfruPfgcMATusQ
         eTqw==
X-Gm-Message-State: APjAAAWPTc0lHHWky5Qdbco9Ach0cLJnGbzT16JNfUhP3Yms7Pu74vlK
        fr0Jz+cSz22mKqBHoiYA+XfErg==
X-Google-Smtp-Source: APXvYqwPFeU8Y6CgNe9DL8TwXaF8mQeR4iRjZAhBXi1Mtx+sh38POX/7XB3F0H4SLlCFSRpPjjml4A==
X-Received: by 2002:a37:67d6:: with SMTP id b205mr18252872qkc.183.1570829755433;
        Fri, 11 Oct 2019 14:35:55 -0700 (PDT)
Received: from chatter.i7.local (192-0-228-88.cpe.teksavvy.com. [192.0.228.88])
        by smtp.gmail.com with ESMTPSA id g25sm4474152qtp.96.2019.10.11.14.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2019 14:35:54 -0700 (PDT)
Date:   Fri, 11 Oct 2019 17:35:53 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Eric Wong <e@80x24.org>
Cc:     Greg KH <gregkh@linuxfoundation.org>, patchwork@lists.ozlabs.org,
        workflows@vger.kernel.org
Subject: Re: RFE: use patchwork to submit a patch
Message-ID: <20191011213553.g3pleurh5uomumi7@chatter.i7.local>
Mail-Followup-To: Eric Wong <e@80x24.org>,
        Greg KH <gregkh@linuxfoundation.org>, patchwork@lists.ozlabs.org,
        workflows@vger.kernel.org
References: <20191010144150.hqiosvwolm3lmzp5@chatter.i7.local>
 <20191011085702.GB1075470@kroah.com>
 <20191011200228.zuka44ve7hob4ia4@chatter.i7.local>
 <20191011212308.xk7xcvfamwnkwovn@dcvr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20191011212308.xk7xcvfamwnkwovn@dcvr>
User-Agent: NeoMutt/20180716
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Fri, Oct 11, 2019 at 09:23:08PM +0000, Eric Wong wrote:
>> (This is the same reason I generally disagree with Eric Wong about
>> preserving SMTP as the primary transmission protocol -- I've heard lots of
>> complaints both from kernel developers and especially from people trying to
>> contribute to CAF about corporate policies actually making it impossible to
>> submit patches -- and no, using a different mail server is not a possibility
>> for them because it can be a firing offense under their IT AUP rules.)
>
>I'm not opposed to a webmail interface tailored to kernel hacking
>which does stuff like checkpatch.pl and get_maintainer.pl before
>sending (similar to your patchwork proposal and
>gitgadgetgadget).  That would get around security appliances
>but SMTP would still be used in the background.
>
>Or offer full-blown HTTPS webmail + IMAP + SMTP access like any
>other webmail provider + checkpatch + get_maintainer helpers.

Well, this is the bit where I say that it may not be allowed by 
corporate rules. I see this all the time in CAF/Android world where 
companies *require* that all email goes through their SMTP server so 
that it can be properly logged (often for legal reasons). And it is 
often equally required that any code submissions come from 
person@corporate.com and not person@free-email-provider.com for 
License/CLA reasons, so setting up a webmail server is not a solution 
either.

This is basically why SMTP sucks in my view -- and it's worthless trying 
to pick fights with IT departments, because they are told to do so by 
lawyers. So, I want to take SMTP out of the equation:

1. provide a way for someone to submit a patch using a web interface 
   (but still in a way that From: is their corporate ID)
2. use individual git feeds as a way to send out patches instead of 
   always being secondary to SMTP

-K
