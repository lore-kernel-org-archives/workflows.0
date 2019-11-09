Return-Path: <SRS0=Iv5R=ZB=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9697C43331
	for <workflows@archiver.kernel.org>; Sat,  9 Nov 2019 04:31:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 807D2207FF
	for <workflows@archiver.kernel.org>; Sat,  9 Nov 2019 04:31:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726061AbfKIEbZ (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 8 Nov 2019 23:31:25 -0500
Received: from outgoing-auth-1.mit.edu ([18.9.28.11]:60560 "EHLO
        outgoing.mit.edu" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726050AbfKIEbZ (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 8 Nov 2019 23:31:25 -0500
Received: from callcc.thunk.org (96-72-102-169-static.hfc.comcastbusiness.net [96.72.102.169] (may be forged))
        (authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
        by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id xA94V7mY011772
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 8 Nov 2019 23:31:08 -0500
Received: by callcc.thunk.org (Postfix, from userid 15806)
        id AD9854202FD; Fri,  8 Nov 2019 23:31:06 -0500 (EST)
Date:   Fri, 8 Nov 2019 23:31:06 -0500
From:   "Theodore Y. Ts'o" <tytso@mit.edu>
To:     Dmitry Vyukov <dvyukov@google.com>
Cc:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        patchwork@lists.ozlabs.org, workflows@vger.kernel.org
Subject: Re: RFE: use patchwork to submit a patch
Message-ID: <20191109043106.GC23325@mit.edu>
References: <20191010144150.hqiosvwolm3lmzp5@chatter.i7.local>
 <20191011085702.GB1075470@kroah.com>
 <f41e7a81-54f4-d4e8-b3c0-d98608fc4bdc@linuxfoundation.org>
 <CACT4Y+aYn57hQ4do0jvUGm-0C02UuDSwWeZL=M6XAaZjS51Jyw@mail.gmail.com>
 <CACT4Y+b=QmYDr97HMF+qXbQ2XxUA8EmYK+reFYtcRxqw=zFfzQ@mail.gmail.com>
 <20191108140249.GA23325@mit.edu>
 <CACT4Y+YpH6epuXBHX4RFiucgDqXkCij2v-o5ZA-q3Hfz0JT5eg@mail.gmail.com>
 <CACT4Y+b1h5pJy5DrRS-MtABY7KF+4u_17yPgHLMx1JdCmf3AXg@mail.gmail.com>
 <20191108141707.2yfxoychd5j3oewn@chatter.i7.local>
 <CACT4Y+ajDz89d0TNU1pS9hS_+bgm5nrPKSAGJ5C=9L0dOyx3mw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACT4Y+ajDz89d0TNU1pS9hS_+bgm5nrPKSAGJ5C=9L0dOyx3mw@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Fri, Nov 08, 2019 at 03:25:00PM +0100, Dmitry Vyukov wrote:
> 
> It has the format=flowed; delsp=yes part:
> 
> Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
> 
> Which according to https://tools.ietf.org/html/rfc3676 seems to mean
> that that line is not wrapped: new line and 1 space needs to be
> removed as part of decoding it.

Actually if you read RFC 3676 carefully, the receiver MAY decode as
you have described above.  It's not even a SHOULD or a MUST.

Essentially format=flowed is only supposed to be used when it's
considered OK for the receiver to reflow (or not) the lines any darned
way it wants.

If you use format=flowed in a context where (a) there might be
whitespace at the end of lines, and random reflowing is a really bad
idea (e.g., C/C++/Python/Java source files, or patches), or (b) where
you really care about whether line breaks when text is quoted and used
in replies (e.g., syzbot's parser which cares about line breaks), you
MUST NOT use format=flowed, or things will only end in tears.

If the problem here is that syzbot mail, and the responses to its
mails, can't be broken in random places, or syzbot parser will be
unhappy.  In that case, you shouldn't have sent it using format=flowed
in the first place.  There are other MIME text formats that are
appropriate in that particular case, but format=flowed is not one of
them.  And if GMail doesn't give you that option, then I suggest that
you either make the Syzbot parser more forgiving, or you find another
mail transport agent.

   		   	     		      - Ted
