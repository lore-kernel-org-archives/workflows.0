Return-Path: <SRS0=dP5A=YB=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 172F1C4360C
	for <workflows@archiver.kernel.org>; Tue,  8 Oct 2019 19:05:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D5C4E2070B
	for <workflows@archiver.kernel.org>; Tue,  8 Oct 2019 19:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1570561532;
	bh=4V3GO25pkUQ0ud8RVvJXHTiMBngD9Qc4NLcHswhC2bQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=wX+5whMFQcqftDnAu4CQFUkdIqeu10bZexaHdYjSf9Lm0zBjBC3K+XZbft0mdTCSy
	 W93KgvVHjBRovrzt4qQ60d3PLh4Imq8F3BrQN89Ljpnm4i0LDiNMvAsUjoJwVhfQ0M
	 gPMbXxPJq7SJ4oSQzDwbWfYVU2PPrtRxXkIsiuPk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727180AbfJHTFc (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 8 Oct 2019 15:05:32 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:39175 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726098AbfJHTFc (ORCPT
        <rfc822;workflows@vger.kernel.org>); Tue, 8 Oct 2019 15:05:32 -0400
Received: by mail-qk1-f194.google.com with SMTP id 4so17842603qki.6
        for <workflows@vger.kernel.org>; Tue, 08 Oct 2019 12:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=vseeuDk135pFT568BnVuQZT+ggtWPPfZkwAhEiTTzK8=;
        b=BWiJab0qimdJTF+UAp0o1DtZfSfXq3X3thMpMSSaRkCrJO83Cv1q8jdvvPdKSjlx1e
         S2QlXby0qL9OCtBofmpdpgxp0LOqY+jIB2DYD0FKDHhFmqQffvuOHyfcFP38fmTTdPoG
         EzdTJ/C9X6H25KSXVzkua45RCHQIYKi94iMdw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=vseeuDk135pFT568BnVuQZT+ggtWPPfZkwAhEiTTzK8=;
        b=Kpfgjy5RE/rtGRBKG234YwH78FWS2IyBpz4V8GrB75hnOHhryncIKrnvYE8iGlzV9K
         CFk0pvJYj9EK1ecJg7r0rP39xik+MmrH6Scr9T6ZTZO0ajtWvZBAzPbGqS0OT1ZFBETi
         O8qlWCogi3ny/YDiQPGsJRVtZwEh7+7fCr/t8kBJi1DYvs0TKqu9F/t+5PF24rblv6/6
         3BzsZQ8IrFFSI7uMDCjvYE4e1cs24CJqPIydiegd91F8x5jnoTPxXW/oDjgXxgkEvyfo
         QSn+UGPW+8hdveOi7A0Eb0jbu1OiTOW029FUNhTpv+irjcVdNw+PqJnFsKq1k1D4OFJu
         NcNw==
X-Gm-Message-State: APjAAAUHMhyOzl99MWsr6NeWrcQTkEAWGVF44pk/UUo/Xoz4P9MZjqfW
        8sKrM38WzazR/FpbzNRePWMPyw==
X-Google-Smtp-Source: APXvYqyw/rV+M75V0IoWNEC6VjsB4HdqhcBDcrbP3BsOC0VOpeEWaKUaew0vtAh2dJ6pwhznotJr/Q==
X-Received: by 2002:a37:65d2:: with SMTP id z201mr3070811qkb.355.1570561529652;
        Tue, 08 Oct 2019 12:05:29 -0700 (PDT)
Received: from chatter.i7.local (192-0-228-88.cpe.teksavvy.com. [192.0.228.88])
        by smtp.gmail.com with ESMTPSA id 207sm11061879qkh.33.2019.10.08.12.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2019 12:05:29 -0700 (PDT)
Date:   Tue, 8 Oct 2019 15:05:27 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Don Zickus <dzickus@redhat.com>
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        Daniel Axtens <dja@axtens.net>,
        David Miller <davem@davemloft.net>, sir@cmpwn.com,
        nhorman@tuxdriver.com, workflows@vger.kernel.org
Subject: Re: thoughts on a Merge Request based development workflow
Message-ID: <20191008190527.hprv53vhzvrvdnhm@chatter.i7.local>
References: <20190924182536.GC6041@hmswarspite.think-freely.org>
 <BX8G8FACJ68D.3RNYA1J9VP98Z@homura>
 <20191007.173329.2182256975398971437.davem@davemloft.net>
 <87zhicqhzg.fsf@dja-thinkpad.axtens.net>
 <20191007211704.6b555bb1@oasis.local.home>
 <20191008164309.mddbouqmbqipx2sx@redhat.com>
 <20191008131730.4da4c9c5@gandalf.local.home>
 <20191008173902.jbkzrqrwg43szgyz@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20191008173902.jbkzrqrwg43szgyz@redhat.com>
User-Agent: NeoMutt/20180716
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Tue, Oct 08, 2019 at 01:39:02PM -0400, Don Zickus wrote:
>Regardless, I think what you wrote re-enforces the idea that emailing a
>patch series (and their vX followups) is messy for the maintainer and a
>more evolved idea is to let a forge take git-push as input.

I'm pretty opposed to the idea of forges, because this approach makes it 
very easy to knock out infrastructure critical to the project's ability 
to quickly roll out fixes. Imagine a situation where there's a zero-day 
remote root kernel exploit -- the attackers would be interested in 
ensuring that it remains unpatched for as long as possible, so we can 
imagine that they will target any central infrastructure where a fix can 
be developed and posted.

Currently, such an attack would be ineffective because even if 
kernel.org is knocked out entirely, collaboration will still happen 
directly over email between maintainers and Linus, and a fix can be 
posted on any number of worldwide resources -- as long as it carries 
Linus's signature, it will be trusted. If we switch to require a central 
forge, then knocking out that resource will require that maintainers and 
developers scramble to find some kind of backup channel (like falling 
back to email). And if we're still falling back to email, then we're not 
really solving the larger underlying problem of "what should we use 
instead of email."

We also shouldn't forget trigger-happy governments that like to ban 
troves of IP addresses in their chase after "the safe internet." Github 
has already been banned a couple of times in China and Russia, and 
chances are that this will continue.

This doesn't mean that forges are entirely out -- but they must remain 
mere tools that participate in a globally decentralized, 
developer-attestable, self-archiving messaging service. Maybe let's call 
that "kernel developer bus" or "kdbus" -- pretty sure that name hasn't 
been used before.

-K
