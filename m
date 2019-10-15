Return-Path: <SRS0=cg+L=YI=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C73FECE588
	for <workflows@archiver.kernel.org>; Tue, 15 Oct 2019 16:17:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 747092064A
	for <workflows@archiver.kernel.org>; Tue, 15 Oct 2019 16:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1571156265;
	bh=7HFP/8hp+asiv1WJ+NGIziTo31/VCM33quFFAX1t4Pk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=c4LoUiUpd596bLs0WVj9FBgoOApF9OALLXW11B9kTW9tJDMxzf7CoE76lM++gBL7R
	 vzFCSaonKJ4ZlKi+yccvrgM9234UYW81SpMBZlQ6sx3zXMhAIRKBJeEcsnuSMtuo3c
	 gHWJOENlrpDbTNN/B5buNPVlpUyz3kzG4aljqvOE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727282AbfJOQRp (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 15 Oct 2019 12:17:45 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:45617 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727809AbfJOQRp (ORCPT
        <rfc822;workflows@vger.kernel.org>); Tue, 15 Oct 2019 12:17:45 -0400
Received: by mail-qt1-f196.google.com with SMTP id c21so31328057qtj.12
        for <workflows@vger.kernel.org>; Tue, 15 Oct 2019 09:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=1C6Gg/X2CzuvzWau86leCOGOXb90qprVaWlZqcMtUGQ=;
        b=ObyDQb7uSp7Vf3Z+3s/KnHhcVIwdolaL1Ak3/ElVi0T+YTOJz1jX/gVz4yezuP3hCc
         rKNFRi1ATWdm92R/M8dmvAOandsTmZPUaOTaTfFduFOJiace+VWZNhMgq7GXNOhiJBgX
         5DTIoiiw8Q6l4bUDy0ky9XAmtMcSDJvVIs+Jk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1C6Gg/X2CzuvzWau86leCOGOXb90qprVaWlZqcMtUGQ=;
        b=UeicpwtxgmDzg/shro9x/+b0nhJTDzd3Ecl6HigLtWXuKWvulNUzTTrEnBt0c9hQFi
         36LqoBbDLySydhnmD7uOOb6LCg5S560uInCS1CAGZ0vKMR9EsOgYEQ49PrKSbt9X1YuV
         EiPam/TZt7Ccmgb23yXznSDm16dKqbASEYzAh2vySlVbE2VdNifdcDcqCVesvvU4SjRE
         bnnNTh/lnKU5ZdrcfH1+bBCXysQx5FwCi/yOD+Vi14QWvzy6e5EHHqIezNgw8I1gCn1s
         lWLha0xq1GDghuZIr5AQV8wKJ/lBp2MOIz+fp9WzYv7zlYVLEqmUOrslfxZH57E27wFU
         9F1Q==
X-Gm-Message-State: APjAAAXlbiIRocJZQS6SQjYjUaEU8lIU3b0gGU9iao/aaELvCCqk/mmY
        gt51BWekaTHtEUr94/04clxByQ==
X-Google-Smtp-Source: APXvYqwHOexyWGFrpAG9C0Er5TczZ6rya/AJmhOpHd+mHcUspUJBeZb59cVc+dHY4LuHW8JFopCxEQ==
X-Received: by 2002:ac8:295a:: with SMTP id z26mr38679517qtz.92.1571156263807;
        Tue, 15 Oct 2019 09:17:43 -0700 (PDT)
Received: from chatter.i7.local (192-0-228-88.cpe.teksavvy.com. [192.0.228.88])
        by smtp.gmail.com with ESMTPSA id k17sm14808494qtk.7.2019.10.15.09.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2019 09:17:43 -0700 (PDT)
Date:   Tue, 15 Oct 2019 12:17:40 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Dmitry Vyukov <dvyukov@google.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Nicolas Belouin <nicolas.belouin@gandi.net>,
        Christian Brauner <christian.brauner@ubuntu.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dmitry Vyukov <dvyukov@gmail.com>,
        Theodore Ts'o <tytso@mit.edu>, Rob Herring <robh@kernel.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>, workflows@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>,
        Bjorn Helgaas <helgaas@kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        Jani Nikula <jani.nikula@intel.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        stefan@datenfreihafen.org, Sasha Levin <sashal@kernel.org>,
        Christoph Hellwig <hch@lst.de>,
        David Miller <davem@davemloft.net>,
        Christian Brauner <christian@brauner.io>
Subject: Re: [MAINTAINERS SUMMIT] Reflections on kernel development processes
Message-ID: <20191015161740.GE11491@chatter.i7.local>
References: <CAMwyc-TzGj4BE0E2tRn8Esj43SnpcWXpS-ureG1YWbmtzmfqbA@mail.gmail.com>
 <20191011083057.GA1074413@kroah.com>
 <CACT4Y+Y=w-vBCKn__ZVM_qk=vU9wactVQkCTLiVp+4OpJW2BgA@mail.gmail.com>
 <CACT4Y+aBJctHyR3EXRevOU6KCaAWFJO75Gr6yB_t-xeWZ8tjLg@mail.gmail.com>
 <20191011091812.68257184@gandalf.local.home>
 <20191011131917.mkq3n5332xlf6lhy@wittgenstein>
 <CACT4Y+ZinMiTq=PtA3ho9WNzvL0UW72FNMeSyY9_gkumjL0jVg@mail.gmail.com>
 <a0836974-15b6-e62f-59bb-95c6ebd95058@gandi.net>
 <CAKMK7uGwAvv87YQZshs+5r0424TirTDX3JSySMOupRp9uRPE0w@mail.gmail.com>
 <CACT4Y+bup25exQ4SjzmEMt3YQ_dT5fCgcfnvOQEM2a6NHnFb5g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <CACT4Y+bup25exQ4SjzmEMt3YQ_dT5fCgcfnvOQEM2a6NHnFb5g@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Tue, Oct 15, 2019 at 09:31:23AM +0200, Dmitry Vyukov wrote:
>> Me too on both interest and slot.
>
>Re logistics, it would be nice to get some room for this. Looking at
>the program committee [1], I see Greg, Steve, Shuah there. Do you know
>if it's possible to get a room? And who can help to organize it?

There are usually "hacker space" rooms made available during OSS events, 
so finding a place to meet for an hour shouldn't be too hard. I will 
email the LF events folks to double-check and follow up here.

-K
