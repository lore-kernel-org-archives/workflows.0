Return-Path: <SRS0=FCe/=XV=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26982C4360C
	for <workflows@archiver.kernel.org>; Thu, 26 Sep 2019 13:12:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 01F39222BE
	for <workflows@archiver.kernel.org>; Thu, 26 Sep 2019 13:12:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726758AbfIZNL7 convert rfc822-to-8bit (ORCPT
        <rfc822;workflows@archiver.kernel.org>);
        Thu, 26 Sep 2019 09:11:59 -0400
Received: from smtprelay0022.hostedemail.com ([216.40.44.22]:39580 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725836AbfIZNL7 (ORCPT
        <rfc822;workflows@vger.kernel.org>); Thu, 26 Sep 2019 09:11:59 -0400
X-Greylist: delayed 574 seconds by postgrey-1.27 at vger.kernel.org; Thu, 26 Sep 2019 09:11:59 EDT
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
        by smtpgrave03.hostedemail.com (Postfix) with ESMTP id 118C7180515DB
        for <workflows@vger.kernel.org>; Thu, 26 Sep 2019 13:02:26 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay02.hostedemail.com (Postfix) with ESMTP id 146796D93;
        Thu, 26 Sep 2019 13:02:25 +0000 (UTC)
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-HE-Tag: tub60_895f490a6660a
X-Filterd-Recvd-Size: 3159
Received: from [192.168.1.39] (unknown [65.39.69.237])
        (Authenticated sender: rostedt@goodmis.org)
        by omf18.hostedemail.com (Postfix) with ESMTPA;
        Thu, 26 Sep 2019 13:02:23 +0000 (UTC)
Date:   Thu, 26 Sep 2019 13:40:15 +0200
User-Agent: K-9 Mail for Android
In-Reply-To: <CAMuHMdX31h-VEf0bCjdTTLSO8xwMdE1cR9GsQ2tEk4PSHOPctA@mail.gmail.com>
References: <1811089.yxvLMk49Ug@kreacher> <20190923162001.GD6005@mit.edu> <CAMuHMdX31h-VEf0bCjdTTLSO8xwMdE1cR9GsQ2tEk4PSHOPctA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8BIT
Subject: Re: Kernel development collaboration platform wish list
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        "Theodore Y. Ts'o" <tytso@mit.edu>
CC:     "Rafael J. Wysocki" <rjw@rjwysocki.net>, workflows@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Helgaas <helgaas@kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>
From:   Steven Rostedt <rostedt@goodmis.org>
Message-ID: <575CE8BF-4C3A-4AEB-8749-9D2B92FCD4D3@goodmis.org>
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

That would be wonderful.

-- Steve

On September 26, 2019 12:18:18 PM GMT+02:00, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>On Wed, Sep 25, 2019 at 6:19 PM Theodore Y. Ts'o <tytso@mit.edu> wrote:
>> One of the things I'd like to add as a strong desire is the ability
>to
>> review patches via web if that's what users would like to do.  There
>> are some real benefits for web-based review.  It means that if you
>> need to see greater context, it's relatively easy to do this.  It
>also
>> is convenient to be able to see the conversation for a particular
>hunk
>> of code right alongside the code.
>>
>> It's clear that whatever we do, it needs to be compatible with
>e-mail.
>> That's very clear.  But it would be useful if we can support both the
>> e-mail and web-based review.  There have some prototypes that have
>> been floated which shows that it is at least possible; perhaps
>> imperfectly, but something which provides a bidrectional gateway
>> between those who perfer to use e-mail and those that prefer to use a
>> web-based UI would be able to do it.
>>
>> There will be many potential kernel contributors who will be used to
>> web-based UI's such as those that are available on github.  So while
>> remaining e-mail compatible, having some way of allow as many
>> operations to be done via web interfaces might help us get some newer
>> developers who are more comfortable to living on the web than some of
>> us more senior developers who remember when "gopher" was a text-based
>> search engine, and not a mascot for the Go programming langauge.  :-)
>
>And if it's done right, it may solve (or make it harder to show) other
>bad review
>behavior, like:
>  - Top posting review comments,
>- Quoting a 2000-line patch when commenting on a single line deep down.
>
>Gr{oetje,eeting}s,
>
>                        Geert

-- 
Sent from my Android device with K-9 Mail. Please excuse my brevity and top posting.
