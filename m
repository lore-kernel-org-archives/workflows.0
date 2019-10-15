Return-Path: <SRS0=cg+L=YI=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C767EC10F14
	for <workflows@archiver.kernel.org>; Tue, 15 Oct 2019 16:11:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 99BBE20640
	for <workflows@archiver.kernel.org>; Tue, 15 Oct 2019 16:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1571155905;
	bh=JQs+0k5Tn+58xOQJ+Qj+9Rz37hSMv8ThUBL9TBt392I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=fc7AehHrtvf1ndChHxBrTHqsEc6N9zGQ8PLVrokGFcTwbbjafUq+7ojaZOpmPcG4G
	 jLJZ7Y0+TQS7m3CTRf+XukyQnNoHrr2/bDqkE8DVAYDV0Lj0KE8jZm18OfdUw1y9Uy
	 4zVJgk+9o38hJ9cFXEoNG36ilwHTn9Ddeb8LRxiw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727610AbfJOQLp (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 15 Oct 2019 12:11:45 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:43943 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727091AbfJOQLp (ORCPT
        <rfc822;workflows@vger.kernel.org>); Tue, 15 Oct 2019 12:11:45 -0400
Received: by mail-qk1-f196.google.com with SMTP id h126so19684794qke.10
        for <workflows@vger.kernel.org>; Tue, 15 Oct 2019 09:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=CVkBcsuOHIc4pew5COofCDDD6TTHTqpw/nqVPxvYV5w=;
        b=OKzfu7Jwb0EfdjwuslXYpNI/ji28avBoKmsNqyTDamMekL3SVYrgK/6HIs+H0pnzfM
         pwDVYZPO/iSn2PCt99l1yV+i0XgbO6EmgmJ0CfJLmf0dHSDbMsMLUpBVZK0edoX6JmFP
         JroWitSkyuZdXNOHyWLCbzBFipxgONwU4TavI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=CVkBcsuOHIc4pew5COofCDDD6TTHTqpw/nqVPxvYV5w=;
        b=jh+oFvT6YU4Ln9AUoFNMEmy+abfFpKcLeBNxYKpl2dSgxoEoKcPP5gVLKaTuGlptfs
         gtGctaDNzXHpGcuLbFuYYqz3QQuQ74bCZubzTEc41m5g/sxd0xsrmRJY9IyqmDA4P33V
         /1PYP9rTOQRcrg9w57JoCAbPCQEqoDLpPtkYPh3kbgzgmpsdu9s5gFy98jpqEh/8yrvK
         1uaggyBWbaX2i/nq9O7nWRFT4Qa9PuOpW6CpUXHXyKZuL/bEt43rOd/7wiaQtnS5nR98
         UOYiyDrv/Y+1YnBc7HB4HXB2cgKqieXm+rxk8Aw9d2vglQ5jTfg0n9TwSgbKBdUUFe8X
         aVUg==
X-Gm-Message-State: APjAAAVUWLv82ME9X6mnMJ64oWd6gKtahxI78O+DzM99fsFvGIlOcAqx
        gjQtGDJy97UIuzQ6RF28r75asF7ZDLI=
X-Google-Smtp-Source: APXvYqwElHUzPYEQYL05NkCEB7Y1blzwSLgmUI4lFTGCEAAs6L2OLzNJtL1okaRzZP9KQn3iLQQYFg==
X-Received: by 2002:a37:2ec6:: with SMTP id u189mr34449980qkh.95.1571155904051;
        Tue, 15 Oct 2019 09:11:44 -0700 (PDT)
Received: from chatter.i7.local (192-0-228-88.cpe.teksavvy.com. [192.0.228.88])
        by smtp.gmail.com with ESMTPSA id f27sm9748547qtv.85.2019.10.15.09.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2019 09:11:42 -0700 (PDT)
Date:   Tue, 15 Oct 2019 12:11:41 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Eric Wong <e@80x24.org>, patchwork@lists.ozlabs.org,
        workflows@vger.kernel.org
Subject: Re: RFE: use patchwork to submit a patch
Message-ID: <20191015161141.GD11491@chatter.i7.local>
Mail-Followup-To: Greg KH <gregkh@linuxfoundation.org>,
        Eric Wong <e@80x24.org>, patchwork@lists.ozlabs.org,
        workflows@vger.kernel.org
References: <20191010144150.hqiosvwolm3lmzp5@chatter.i7.local>
 <20191011085702.GB1075470@kroah.com>
 <20191011200228.zuka44ve7hob4ia4@chatter.i7.local>
 <20191011212308.xk7xcvfamwnkwovn@dcvr>
 <20191011213553.g3pleurh5uomumi7@chatter.i7.local>
 <20191012071911.GA2034802@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20191012071911.GA2034802@kroah.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Sat, Oct 12, 2019 at 09:19:11AM +0200, Greg KH wrote:
>> This is basically why SMTP sucks in my view -- and it's worthless 
>> trying to
>> pick fights with IT departments, because they are told to do so by lawyers.
>> So, I want to take SMTP out of the equation:
>>
>> 1. provide a way for someone to submit a patch using a web interface   (but
>> still in a way that From: is their corporate ID)
>
>If you do this, what happens when a maintainer/reviewer responds to that
>patch and says "looks good, but can you change X and resend it?"
>
>How will they get that message if it didn't go through their email
>system?  How will they be able to respond to it?

The magic of git and email headers. Only the initial submission will go 
out of this web service -- the follow-up is expected to arrive into 
their mailbox.

>> 2. use individual git feeds as a way to send out patches instead of   always
>> being secondary to SMTP
>
>Sending patches that way is one thing, the interaction based on those
>patches is another.
>
>Everyone needs to remember that only 1/3 of the patches submitted are
>applied.  The "normal" path of development is at least a review/resend
>cycle for submissions (2/3 of patches).  So that 2/3 can't be ignored as
>the "new/drive-by submissions" are probably more in that category than
>not.

Right, the idea is that the imaginary tool that is backed by 
public-inbox will use multiple sources of content:

- the mailing list repository
- individual developer feeds
- the person's imap folder

Anything that shows up in the individual feeds should have a 
corresponding entry in the mailing list repository, but the latter is 
also cryptographically signed and therefore end-to-end attestable.  
Mailing lists and SMTP continue to be the fallback delivery method for 
the vast majority of the content.

I expect to lay this out in more detail as I prepare the "kthul MVP" 
roadplan.

-K
