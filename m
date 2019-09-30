Return-Path: <SRS0=YmVK=XZ=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA2A9C32792
	for <workflows@archiver.kernel.org>; Mon, 30 Sep 2019 13:29:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 69860215EA
	for <workflows@archiver.kernel.org>; Mon, 30 Sep 2019 13:29:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gandi.net header.i=@gandi.net header.b="alW8un6j"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729738AbfI3N3H (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 30 Sep 2019 09:29:07 -0400
Received: from mail12.gandi.net ([217.70.182.73]:44679 "EHLO gandi.net"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728214AbfI3N3H (ORCPT <rfc822;workflows@vger.kernel.org>);
        Mon, 30 Sep 2019 09:29:07 -0400
X-Greylist: delayed 529 seconds by postgrey-1.27 at vger.kernel.org; Mon, 30 Sep 2019 09:29:04 EDT
Received: from diconico07.dev (unknown [IPv6:2001:4b98:beef:a:e921:9c91:35ed:759a])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by gandi.net (Postfix) with ESMTPSA id CD90A1604EC;
        Mon, 30 Sep 2019 13:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gandi.net; s=20190808;
        t=1569849613;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=W9AaDzKxe7kVvQN2VoEqjwQ9OnRIv7G1wbsUlTVGmAI=;
        b=alW8un6jn+MY+zRShtCCoA8DjAn/p8+X6QGKZpDqZDw1ovTaO5VRwVLjy80scAkLvCoMQE
        Ys34h9vXWUjyBljrlLPsmfSZDE25kxk5PMXdNHjwgtEEgENKhgQYFo2q56PQsMJ8iiEp5r
        oOdzO/EEyYN2UgeUvEUTKcwo2q3EX+FParLfSm70Zn2YWXkxk1kuBbq2eY7WvL7OAW4gKt
        t1jg3v8Dod0QqaIHsULknflrRxI0H6UJhmO05FEXs0AK5oPcyIhdkfCjQ4oxn471pRQFE9
        2AM/NG72X6z2I9Zh20Uprh8xwTLOmPthV0LJn0Jj6G2I4yJAeZkYH3w/zoJvhg==
Subject: Re: thoughts on a Merge Request based development workflow
To:     Neil Horman <nhorman@tuxdriver.com>,
        Dmitry Vyukov <dvyukov@google.com>
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Drew DeVault <sir@cmpwn.com>, workflows@vger.kernel.org
References: <20190924185312.GD6041@hmswarspite.think-freely.org>
 <20190924202423.GA14425@pendragon.ideasonboard.com>
 <20190924222502.GA11633@hmswarspite.think-freely.org>
 <20190925205036.GA7763@pendragon.ideasonboard.com>
 <20190926004045.GA20302@localhost.localdomain>
 <20190928185848.76c85a9d@oasis.local.home>
 <20190929115722.GA26820@hmswarspite.think-freely.org>
 <CACT4Y+Z8_fABZSXahiGaOxKiPa+K3hxhvH8EVenuuqOs3aCwZg@mail.gmail.com>
 <20190930010054.GA2973@localhost.localdomain>
 <CACT4Y+ZUAa3_LMm3NqsUu7s9mRaY=1jNwDf+2x3cBVNouUTNXQ@mail.gmail.com>
 <20190930125548.GA6647@hmswarspite.think-freely.org>
From:   Nicolas Belouin <nicolas.belouin@gandi.net>
Message-ID: <55361d4f-af05-f06b-8aa2-8740719627df@gandi.net>
Date:   Mon, 30 Sep 2019 15:20:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20190930125548.GA6647@hmswarspite.think-freely.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org



On 9/30/19 2:55 PM, Neil Horman wrote:
> On Mon, Sep 30, 2019 at 08:05:04AM +0200, Dmitry Vyukov wrote:
>> On Mon, Sep 30, 2019 at 3:01 AM Neil Horman <nhorman@tuxdriver.com> wrote:
>>> On Sun, Sep 29, 2019 at 02:55:25PM +0200, Dmitry Vyukov wrote:
>>>> On Sun, Sep 29, 2019 at 1:57 PM Neil Horman <nhorman@tuxdriver.com> wrote:
>>>>> On Sat, Sep 28, 2019 at 06:58:48PM -0400, Steven Rostedt wrote:
>>>>>> On Wed, 25 Sep 2019 20:40:45 -0400
>>>>>> Neil Horman <nhorman@tuxdriver.com> wrote:
>>>>>>
>>>>>>> Eventually, barring any really significant objection, hes going to make
>>>>>>> the switch, and users will either have to get github accounts, or stop
>>>>>>> participating in netdev development.
>>>>>> That will be a very sad day if that happened.
>>>>>>
>>>>>> Whatever service should have an email interface. For example, if I get
>>>>>> a message from bugzilla.kernel.org, I can reply back via email and it
>>>>>> is inserted into the tool (as I see my Out of office messages going
>>>>>> into it. I need to fix my scripts not to reply to bugzilla).
>>>>>>
>>>>> Forge solutions do have the ability to use email as an interface to
>>>>> issue tracking, thats not a problem.  What they don't currently seem to
>>>>> have is the ability to emulate patch review workflows.  And thats not to
>>>>> say they couldn't, but it seems to me that they haven't prioritized that
>>>>> because they offer several different types of comment options
>>>>> (commenting in the pull request discussion(s) themselves vs commenting
>>>>> on code, etc.  If they sould implement that, I think alot of this would
>>>>> become alot easier.
>>>>>
>>>>>> I set up patchwork on my INBOX, as I'm having a hard time of separating
>>>>>> patches from the noise. And it works really well. I would love to be
>>>>>> able to push my patchwork list to a public place so that others can see
>>>>>> it too. As mentioned in the Maintainers Summit, it would be great to be
>>>>>> able to pull patchwork down to my laptop, get on the plane, process a
>>>>>> bunch of patches while flying, and then when I land, I could push the
>>>>>> updates to the public server.
>>>>>>
>>>>>> That's pretty much all I'm looking for.
>>>>>>
>>>>> I think what you are looking for here is a way to pull down a set of
>>>>> merge requests, review and merge those you approve, and push them back
>>>>> when you are back online?  I think you can do at least some of that.
>>>>> Forge solutions (definately gitlab, likely github), allow you to pull
>>>>> a merge request reference namespace (on gitlab its
>>>>> heads/merge_requests/<merge_request_id>).  You can merge whatever head
>>>>> there you like to its intended target branch, and when you push, it will
>>>>> update the corresponding MR to the MERGED state.  What you can't
>>>>> currently do is make a comment on an MR, store that comment in git and
>>>>> then have the MR updated with those comments.  That would be a great
>>>>> item to make that feature more complete.
>>>> One mismatch with kernel dev process that seem to be there for lots of
>>>> existing solutions (gerrit, git-appraise, github, gitlab) is that they
>>>> are centered around a single "mail" git tree (in particular,
>>>> gerrit/git-appraise check in metainfo right into that repo). Whereas
>>>> kernel has lots of kernels. Now if Steve is CCed on lots of changes
>>>> what git tree should he pull before boarding a place? For some changes
>>>> it may be unclear what tree they should go into initially, or that may
>>>> change over time. Then, there are some additional relations with
>>>> stable trees.
>>>> I suspect that kernel tooling should account for that and separate
>>>> changes layer from exact git trees. Like mailing lists. Usually there
>>>> is 1 mailing list and 1 git tree per subsystem, but still this
>>>> relation is not fixed and one can always CC another mailing list, or
>>>> retarget the change, etc.
>>>> What do you think?
>>>>
>>> I agree that newer review solutions (of the type you ennummerated) rely
>>> on centralization of information, which is undesireable in many cases,
>>> but I'm not sure how to avoid that.
>> Well, FWIW the SSB protocol and similar would avoid that:
>> https://people.kernel.org/monsieuricon/patches-carved-into-developer-sigchains
>>
> I wasn't aware of this framework, thats pretty cool and could be a
> potential solution, yes.  
>
> That said, it doesn't solve the casual contributor issue.  From the
> section on raising the entry barrier:
>
> "We would need full-featured web clients that would allow someone to browse projects 
> in a similar fashion as they would browse them on Git..b, including viewing issues, 
> submitting bug reports, and sending patches and pull requests."
>
> Once we start talking about having to maintain web interfaces, and
> especially if we are also considering features like CI, it seems to me
> we are talking about falling back effectively to a forge solution that
> allows data interchange via SSB.  While thats a good feature add, its
> really an addition to a forge solution, not a standalone mechanism.
>
From my point of view its quite the opposite: The forge-like interfaces
are just clients to the SSB, you can take whatever client you want and
can easily work with others even if they use another client or don't
agree with the term of use of a specific client. The main point here is
not to have a single point of failure, for now if kernel.org goes down
for any reason (or gets compromised) you still have many fully
functional "forks" you can base yourself on that have the full history
of the project. The idea would be to have the same mechanism for code
review and issues tracking.

Nicolas
