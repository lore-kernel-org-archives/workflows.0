Return-Path: <SRS0=Hr5F=ZA=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0170AFA372C
	for <workflows@archiver.kernel.org>; Fri,  8 Nov 2019 14:17:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C4AA921924
	for <workflows@archiver.kernel.org>; Fri,  8 Nov 2019 14:17:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LaAbP9k6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726039AbfKHORL (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 8 Nov 2019 09:17:11 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:48926 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726281AbfKHORL (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 8 Nov 2019 09:17:11 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 63AB72D1;
        Fri,  8 Nov 2019 15:17:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1573222629;
        bh=NGbhvtunYrP0+7TBF7v4nZANuTDkl3YqXzCOWBZTZho=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LaAbP9k65Zq/3Lit2qJOsV1e+aQ5yyN5EHDnWUx+twfz1/v7SCg+IRSp4St9yaOi5
         3eBIUomUHlrZPHrysTbHQhgH3Z9o6FA6UvF9p/tJyh0cupL0jo+d/WSh+UhgeP3Wwz
         acghxIz2IT6wYKgO9PemBpL4uby6Lbw8peQY0jmk=
Date:   Fri, 8 Nov 2019 16:17:00 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     "Theodore Y. Ts'o" <tytso@mit.edu>
Cc:     Dmitry Vyukov <dvyukov@google.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        patchwork@lists.ozlabs.org, workflows@vger.kernel.org
Subject: Re: RFE: use patchwork to submit a patch
Message-ID: <20191108141700.GL4866@pendragon.ideasonboard.com>
References: <20191010144150.hqiosvwolm3lmzp5@chatter.i7.local>
 <20191011085702.GB1075470@kroah.com>
 <f41e7a81-54f4-d4e8-b3c0-d98608fc4bdc@linuxfoundation.org>
 <CACT4Y+aYn57hQ4do0jvUGm-0C02UuDSwWeZL=M6XAaZjS51Jyw@mail.gmail.com>
 <CACT4Y+b=QmYDr97HMF+qXbQ2XxUA8EmYK+reFYtcRxqw=zFfzQ@mail.gmail.com>
 <20191108140249.GA23325@mit.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191108140249.GA23325@mit.edu>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Hi Ted,

On Fri, Nov 08, 2019 at 09:02:49AM -0500, Theodore Y. Ts'o wrote:
> On Fri, Nov 08, 2019 at 10:44:25AM +0100, Dmitry Vyukov wrote:
> > syzbot asks to provide fixing commit in a particular format (and on 1
> > line, otherwise not possible to parse back).
> > 
> > It sent this yesterday:
> > https://groups.google.com/forum/message/raw?msg=syzkaller-bugs/IZZUu-BobtI/xAkxm6H4EQAJ
> 
> This is Shuah's reply, not the syzbot original message.  Looks like
> you cut and pasted the same URL twice?
> 
> The correct URL is:
> 
> https://groups.google.com/forum/message/raw?msg=syzkaller-bugs/IZZUu-BobtI/wQdqUSHuEQAJ
> 
> .. and it looks like what Syzbot sent was already line-wrapped:
> 
> > If the result looks correct, please mark the bug fixed by replying with:
> >
> >#syz fix: usb: usbip: Fix BUG: KASAN: slab-out-of-bounds in
> >vhci_hub_control()
> 
> So I don't think you can blame this on how Shuah replied, or how
> Mozilla handled things.  It looks like either Syzbot or more likely,
> GMail on its outgoing path "added value" by line-wrapping the message,
> probably because of the following MIME setting:
> 
> > Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
> 
> Flowing text lines and deleting spaces is always, ALWAYS, a bad idea
> when sending plain text.  In this case, it wasn't just a patch that
> got corrupted, but the instructions from Syzbot, which it appears
> Shuah followed faithfully.  :-)
> 
> IBM handled this problem by standing up an open source e-mail system
> because Lotus Notes couldn't be fixed.  If we can't fix GMail, then
> David Miller may be right, and e-mail may be doomed.  (I don't like
> that answer myself, since so far all of the alternatives seem to be
> categorically worse for our use case, but...)

Since when did we decide to let Google dictate what tools were are or
are not allowed to use ? :-) If gmail isn't suitable as an e-mail
provider, we should be vocal about it.

-- 
Regards,

Laurent Pinchart
