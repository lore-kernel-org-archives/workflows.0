Return-Path: <SRS0=cg+L=YI=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61BB1C10F14
	for <workflows@archiver.kernel.org>; Tue, 15 Oct 2019 15:40:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 357DF205F4
	for <workflows@archiver.kernel.org>; Tue, 15 Oct 2019 15:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1571154016;
	bh=OR1PVntHKf2Y2qPMiepwm84/vlqolsI+E0dD3V3mUBE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=IoGfUgBTPL8z/3L+1vIVAJbueb7AIabjL4Cfqzbi578U3CurIJ8B+9tn3ZBgSLdJ9
	 6sFmJ6pcXASSTkoXdbCY2L0C30+MbNuJ4aGdVfNmrM6BPSX8POqdyk5lOLCj+C8e3V
	 1MlHX/2ceepo5z8ia7iMk++kQOyPo42TOblUe5C4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726874AbfJOPkQ (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 15 Oct 2019 11:40:16 -0400
Received: from mail-qt1-f178.google.com ([209.85.160.178]:41513 "EHLO
        mail-qt1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726231AbfJOPkP (ORCPT
        <rfc822;workflows@vger.kernel.org>); Tue, 15 Oct 2019 11:40:15 -0400
Received: by mail-qt1-f178.google.com with SMTP id v52so31170103qtb.8
        for <workflows@vger.kernel.org>; Tue, 15 Oct 2019 08:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=SXbKoxTjBCU8oZzw6SepJZg98q8yKT9wpbyVuFTQyfI=;
        b=MX+4FHDWqPsbcHdPJhZRuryH+Za0GVbIolqin2rHjs6LZthrru9QzFAi67dhWZUmJS
         5LGwLV+dxpIkrprezxXIodB9puEktRq9t5WHHGNCPy4SaOtOp+AM+6ys+TZzWvAhEfH4
         Eo2YkUZqm8QVWZ6eKTwC9G8XIafSLoQZJg2L4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=SXbKoxTjBCU8oZzw6SepJZg98q8yKT9wpbyVuFTQyfI=;
        b=p2JmT69ZNbTWiL5MUye16ICSyPBIoNMjyQA1IkmmFiej4HWkm4V68Y69uv+ACHsCT8
         Yp/jkv+Ga86Fxbbepsj1Y4WhZrdtdDmM4OOSrmymx7Nr86zoTnmt/sVYOM0BEjRMwd65
         VnyopprlvtQepvSBPVc47U3gCGsJ87Q9yKa4AakLFYLpsMfLH8u1bBzsFXb9U96Jy2Ny
         rsu1R8ymY73f4giPR53VX+5TFJVVFpZ1BgWM8a70q5R3sfUnXjus349OwhL9+L/ds9Eg
         oCDZK2P+Ew8lepAFflVc4lS1vBGy9l67JqnrxHrUmcEhEHdztPdPlA0VOkTYwrFQoczT
         sn9g==
X-Gm-Message-State: APjAAAWi6vmXzzs2hwqp1Y5knn+eWg716dU3UHph6th9tclE4b6mUtE3
        HhKMcZ2fHrI62CGnWXwrbZiEYBe1bQs=
X-Google-Smtp-Source: APXvYqzWf8tIidmjV8orH/tjJZEBTuCw8gG+Zd+qVJ1Cfry/2FF0KYN2uRJZp8hY8wXTKx7jCPeXog==
X-Received: by 2002:ac8:5243:: with SMTP id y3mr20377825qtn.74.1571154013251;
        Tue, 15 Oct 2019 08:40:13 -0700 (PDT)
Received: from chatter.i7.local (192-0-228-88.cpe.teksavvy.com. [192.0.228.88])
        by smtp.gmail.com with ESMTPSA id x76sm9753920qkb.29.2019.10.15.08.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2019 08:40:12 -0700 (PDT)
Date:   Tue, 15 Oct 2019 11:40:10 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Eric Wong <e@80x24.org>, Greg KH <gregkh@linuxfoundation.org>,
        patchwork@lists.ozlabs.org, workflows@vger.kernel.org
Subject: Re: RFE: use patchwork to submit a patch
Message-ID: <20191015154010.GC11491@chatter.i7.local>
Mail-Followup-To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Eric Wong <e@80x24.org>, Greg KH <gregkh@linuxfoundation.org>,
        patchwork@lists.ozlabs.org, workflows@vger.kernel.org
References: <20191010144150.hqiosvwolm3lmzp5@chatter.i7.local>
 <20191011085702.GB1075470@kroah.com>
 <20191011200228.zuka44ve7hob4ia4@chatter.i7.local>
 <20191011212308.xk7xcvfamwnkwovn@dcvr>
 <20191011213553.g3pleurh5uomumi7@chatter.i7.local>
 <20191014153333.GB23442@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20191014153333.GB23442@pendragon.ideasonboard.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Mon, Oct 14, 2019 at 06:33:33PM +0300, Laurent Pinchart wrote:
>If the goal is to work around SMTP-related technical issues, is a web UI
>really the best way to go ? Wouldn't it be better to do the same through
>a git push ? We could setup a git server that requires authentication,
>and implement a push-to-email bridge. The information that would need to
>be entered in a web UI could be put in a tag message, and we could have
>a CLI to create the tag from a list of questions.

Well, this is largely what GitGitGadget does 
(https://gitgitgadget.github.io), and we could go that route, sure. I'm 
reluctant only because, quoth:

  GitGitGadget itself is a GitHub App that is backed by an Azure 
  Function written in pure Javascript which in turn triggers an Azure 
  Pipeline written in Typescript (which is really easy to understand and 
  write for everybody who knows even just a little Javascript), 
  maintained at https://github.com/gitgitgadget/gitgitgadget.

I have zero familiarity with any of the above. That said, we do have a 
bunch of CI engineers working at the LF, and I can probably avail myself 
of their expertise if we decide to set this up.

-K
