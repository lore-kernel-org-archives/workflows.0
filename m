Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CAE2C433EF
	for <workflows@archiver.kernel.org>; Tue, 14 Dec 2021 02:12:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231683AbhLNCMy (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 13 Dec 2021 21:12:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229511AbhLNCMx (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 13 Dec 2021 21:12:53 -0500
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B793C061574
        for <workflows@vger.kernel.org>; Mon, 13 Dec 2021 18:12:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
        :In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
        Sender:Reply-To:Content-ID:Content-Description;
        bh=Kxc89h85eCaHdTWpOcnxkdtQNkWS/eM0xgrTzpP2Sqs=; b=ZoEtCvM18JA9HfxBN3hBwfIG/4
        HDV8q6YIYx+4mAHMuxbDL9Wmzbi/zu47/zRTjKEOct8OzBUqkfMidYYuGDYxupvoiYxknRUU5+wtC
        7efs5UeZxhB9ArJkwVLZBQA52eBFbDlRP3Bps6rlMrMUeniV3zti7VNmsMNLs75q9sFZ8VJvkGjdP
        X3dcQqacGnng9BrDDyw17wYYr7Q5YEfbk9tIKYCwv1Fi8JroKX9uHjMH7NQPpvA5bzNlAlWPHCVh4
        tpyAmEnSVAule6B4JXpUexn7hcFRAGbKpYyWC89pHhCYI4UR8wtbyPKh05gdmpyBrwPrPY319BMlI
        Pajpvk0Q==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mwxJA-001EPi-8g; Tue, 14 Dec 2021 02:12:50 +0000
Message-ID: <1919dc6e-66b7-4179-7991-cbae44215c1f@infradead.org>
Date:   Mon, 13 Dec 2021 18:12:44 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: Monitoring the status of your own patches on patchwork?
Content-Language: en-US
To:     Simon Glass <sjg@chromium.org>,
        =?UTF-8?Q?Toke_H=c3=b8iland-J=c3=b8rgens?= =?UTF-8?Q?en?= 
        <toke@redhat.com>
Cc:     workflows@vger.kernel.org
References: <87mtl7ufl3.fsf@toke.dk>
 <CAPnjgZ1THJQSUj2Mmq2P6EtJXZQV=th0vnN2cLZ=BZe_sck+SA@mail.gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <CAPnjgZ1THJQSUj2Mmq2P6EtJXZQV=th0vnN2cLZ=BZe_sck+SA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org



On 12/13/21 10:37, Simon Glass wrote:
> Hi,
> 
> On Sat, 11 Dec 2021 at 12:06, Toke Høiland-Jørgensen <toke@redhat.com> wrote:
>>
>> Hi everyone!
>>
>> I was wondering if anyone had any nifty tricks or utilities to help
>> monitor the status of your own patch submissions on a patchwork
>> instance? Things like getting a notification when a patch changes status
>> or when one of the automated checks on that particular patchwork
>> instance fails for a patch you submitted?
>>
>> I can just filter the patchwork web interface to my name, of course, but
>> I would like something that can be automated so I can make the stuff I
>> care about show up in my inbox :)
> 
> I'll just mention 'patman status' here, which collects tags from
> patchwork so you can send them with the next version. It also shows
> you code-review snippets on the cmdline which I find much faster to
> process, particularly for large patches. See below, although it's a
> bit hard to read without the colours that patman uses.
> 
> I would like something that can track all the series and tell me what
> is outstanding. At the moment I keep a manual list but often forget
> things.

Hi,
Where is this 'patman' found, please?

I see   https://source.denx.de/u-boot/custodians/u-boot-dm/-/tree/patman-working
and   https://github.com/siemens/u-boot/tree/master/tools/patman
(the latter one seems to be untouched recently).

Is there another URL or is the denx.de URL the one to use?

thanks.
-- 
~Randy
