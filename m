Return-Path: <SRS0=W/h6=X2=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0066BC352AA
	for <workflows@archiver.kernel.org>; Tue,  1 Oct 2019 21:33:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CD8E1215EA
	for <workflows@archiver.kernel.org>; Tue,  1 Oct 2019 21:33:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727895AbfJAVdT (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 1 Oct 2019 17:33:19 -0400
Received: from www62.your-server.de ([213.133.104.62]:55778 "EHLO
        www62.your-server.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727893AbfJAVdT (ORCPT
        <rfc822;workflows@vger.kernel.org>); Tue, 1 Oct 2019 17:33:19 -0400
Received: from sslproxy05.your-server.de ([78.46.172.2])
        by www62.your-server.de with esmtpsa (TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.89_1)
        (envelope-from <daniel@iogearbox.net>)
        id 1iFPlc-0001dI-M9; Tue, 01 Oct 2019 23:33:08 +0200
Received: from [178.197.248.57] (helo=pc-63.home)
        by sslproxy05.your-server.de with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.89)
        (envelope-from <daniel@iogearbox.net>)
        id 1iFPlc-000QGf-EA; Tue, 01 Oct 2019 23:33:08 +0200
Subject: Re: [Ksummit-discuss] [MAINTAINERS SUMMIT] Reflections on kernel
 development processes
To:     konstantin@linuxfoundation.org
References: <20190912120602.GC29277@pure.paranoia.local>
 <d6e8f49e93ece6f208e806ece2aa85b4971f3d17.1569152718.git.dvyukov@google.com>
 <610c62f2-f2e4-2eb1-3051-53c573194f52@iogearbox.net>
 <20190930212410.GE14403@pure.paranoia.local>
From:   Daniel Borkmann <daniel@iogearbox.net>
Cc:     Dmitry Vyukov <dvyukov@gmail.com>,
        ksummit-discuss@lists.linuxfoundation.org, tytso@mit.edu,
        robh@kernel.org, laurent.pinchart@ideasonboard.com,
        rjw@rjwysocki.net, workflows@vger.kernel.org,
        skhan@linuxfoundation.org, gregkh@linuxfoundation.org,
        helgaas@kernel.org, jikos@kernel.org, jani.nikula@intel.com,
        geert@linux-m68k.org, stefan@datenfreihafen.org, sashal@kernel.org,
        hch@lst.de, Dmitry Vyukov <dvyukov@google.com>
Message-ID: <a01ead7c-94ce-12ef-a043-6fd492c6c431@iogearbox.net>
Date:   Tue, 1 Oct 2019 23:33:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190930212410.GE14403@pure.paranoia.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Authenticated-Sender: daniel@iogearbox.net
X-Virus-Scanned: Clear (ClamAV 0.101.4/25589/Tue Oct  1 10:30:33 2019)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On 9/30/19 11:24 PM, Konstantin Ryabitsev wrote:
> On Mon, Sep 23, 2019 at 02:52:01PM +0200, Daniel Borkmann wrote:
>>> Most (all) of the "kit" functionality should be separated from the UI
>>> and be available for scripting/automation/other UIs. Whether it's
>>> done as "libgit" or as "shell out" is discussable.
>> [...]
>> On that note, such a tool would also need to co-exist with the current
>> email based process for some (long?) time in order to allow a smooth
>> transition period. Last week I spent a few of nights hacking a small tool
>> which is regularly pulling the lore git trees I'm interested in and checking
>> out all [new] mails into maildir format so they can be read naturally by
>> UIs like mutt et al [0]. As an experiment, in case of bpf vger mailing list,
>> it extracts all current ~8k mails in under a second:
> 
> Thanks for working on this -- I've started on a similar tool in the
> past, but got distracted and never completed it. In my implementation,
> it was piping messages to procmail, which allowed writing complex rules
> for folders/pre-processing, etc. May I suggest that your tool also
> offers a stdout that can be piped to procmail?

I have a rough version working now. ;-) Just pushed to [0]. Let me know if that
does the trick on your side, I've added example configs for procmail to the repo
as well for getting started. Did a quick run for l2md -> procmail -> mutt and
seems fine as far as I can tell. (Patches always welcome of course.)

Thanks,
Daniel

   [0] https://git.kernel.org/pub/scm/linux/kernel/git/dborkman/l2md.git/
