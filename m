Return-Path: <SRS0=tG+E=YH=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B2A1C4CECE
	for <workflows@archiver.kernel.org>; Mon, 14 Oct 2019 07:31:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E035220673
	for <workflows@archiver.kernel.org>; Mon, 14 Oct 2019 07:31:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gandi.net header.i=@gandi.net header.b="JWI4DF5y"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728816AbfJNHbk (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 14 Oct 2019 03:31:40 -0400
Received: from mail12.gandi.net ([217.70.182.73]:60787 "EHLO gandi.net"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728811AbfJNHbk (ORCPT <rfc822;workflows@vger.kernel.org>);
        Mon, 14 Oct 2019 03:31:40 -0400
Received: from diconico07.dev (unknown [IPv6:2001:4b98:beef:a:e921:9c91:35ed:759a])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by gandi.net (Postfix) with ESMTPSA id 6233216034F;
        Mon, 14 Oct 2019 07:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gandi.net; s=20190808;
        t=1571038297;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=uiwfibmGY9ehZinLThdDhJ7wC91bUpM0rgOoZr+R+uQ=;
        b=JWI4DF5yyT8+JVOh19Ongk5Tyqm5sRhz9K9Yuf/80fH0N9Y7nOh1HxRXpUrfzm5UNDydhA
        ApIXTn2TDfUesyckUurfoeld1vJk0h7n3gjC8EHyOrRuJp6UlPWtWqsMMxOaIeAVFgNazI
        IilD6vAEYYirecS1BP6ev9h3ZyWHmB4U2mECge0qd2w4vnFuwsKTCSEKyz21R+VK2Ao4nA
        2ymPVeqynDDNl7VUfvNx6qEMVP9hNRCUH3VDjBzA6llSTR+ttq47tNB8W7PU+fCwN0qnCO
        G1lZ6rCUKuCsW10a4PfGAyw+YMsnXN+eLdtjLyfBYrFFONT4fBsE1zHc9LRf4A==
Subject: Re: thoughts on a Merge Request based development workflow
To:     Dmitry Vyukov <dvyukov@google.com>
Cc:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Eric Wong <e@80x24.org>, Laura Abbott <labbott@redhat.com>,
        Don Zickus <dzickus@redhat.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Daniel Axtens <dja@axtens.net>,
        David Miller <davem@davemloft.net>,
        Drew DeVault <sir@cmpwn.com>,
        Neil Horman <nhorman@tuxdriver.com>, workflows@vger.kernel.org
References: <20191007.173329.2182256975398971437.davem@davemloft.net>
 <87zhicqhzg.fsf@dja-thinkpad.axtens.net>
 <20191007211704.6b555bb1@oasis.local.home>
 <20191008164309.mddbouqmbqipx2sx@redhat.com>
 <20191008131730.4da4c9c5@gandalf.local.home>
 <20191008173902.jbkzrqrwg43szgyz@redhat.com>
 <20191008190527.hprv53vhzvrvdnhm@chatter.i7.local>
 <bbf9d038-2238-b97f-7cae-97804ee1624c@redhat.com>
 <20191009215416.o2cw6cns3xx3ampl@chatter.i7.local>
 <20191009222156.nedvmajswb3w3r3c@dcvr>
 <20191009235631.hhkbxoiqgzyypcer@pure.paranoia.local>
 <cf24af7f-6094-5b96-8e65-58b74bbee247@gandi.net>
 <CACT4Y+aEPnZ=aniEZ4JxNSE21oExX3X0s2-LX+AdGx3Q0v=C4Q@mail.gmail.com>
 <882d9408-eb8d-0f32-ce7f-7e5f6e8b08fd@gandi.net>
 <CACT4Y+aD=NMqeErSnq_5ssLT-ATuGEqaz7_t45FSrgHTybOFag@mail.gmail.com>
From:   Nicolas Belouin <nicolas.belouin@gandi.net>
Message-ID: <c02f77c1-2004-d6b8-b1de-2d34c5031f01@gandi.net>
Date:   Mon, 14 Oct 2019 09:31:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CACT4Y+aD=NMqeErSnq_5ssLT-ATuGEqaz7_t45FSrgHTybOFag@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org



On 10/11/19 3:56 PM, Dmitry Vyukov wrote:
> On Fri, Oct 11, 2019 at 9:12 AM Nicolas Belouin
> <nicolas.belouin@gandi.net> wrote:
>>> <nicolas.belouin@gandi.net> wrote:
>>>> On 10/10/19 1:56 AM, Konstantin Ryabitsev wrote:
>>>>> On Wed, Oct 09, 2019 at 10:21:56PM +0000, Eric Wong wrote:
>>>>>> One of my long-term visions is to have an agreed upon way to
>>>>>> have entirely forkable development communities.  Git already
>>>>>> gave us forkable code repositories.
>>>>> FYI, this does already exist in the form of Fossil:
>>>>> https://www.fossil-scm.org/home/doc/trunk/www/index.wiki
>>>>>
>>>>> The main reason why we can't really consider it is because it requires
>>>>> moving away from git, which is a non-starter for anyone.
>>>>>
>>>>> -K
>>>> Maybe the solution is to build such kind of features within git,
>>>> many proposed solutions with tools over git or using git.
>>>> A tool over git has the issue of conveying the data and making
>>>> it non-centralized, whereas a tool using git is non-scalable because
>>>> of the way git is *currently* storing things.
>>>> Improving git to make it able to store many more objects (be it in-review
>>>> commits or previous versions of patches) and then use it to get the kind
>>>> of features we can envy from fossil.
>>> Hi Nicolas,
>>>
>>> I am trying to imagine how a complete solution based on git could look
>>> like, but I am failing. It seems that there is a number of problems
>>> beyond scalability/storage.
>>> First, that git probably should be orthogonal to the kernel source git
>>> trees, right? People work with multiple kernel trees, sometimes
>>> changes migrate, parts of a series can be merged into different trees,
>>> etc.
>> This I think can't be helped if going through a Merge/Pull request workflow
>> as a request will always be seen as a whole applied to a specific tree,
>> I agree
>> though the external tool solution might help for tree migration though.
>> And I
>> don't really have a solution for these issues.
>>> Then, do we do a single git where everybody has write access, or
>>> per-developer git? If we do a global git and everybody has write
>>> access, this looks somewhat problematic. If we have multiple
>>> per-developer gits, then it does not solve the whole problem of
>>> synchronization and data exchange, one can't pull from thousands of
>>> unknown gits every time.
>> For this one I thought of per-developer git with a branch per series
>> with MR discussion attached to the branch on the developer side and on
>> maintainer/reference tree side a reference indicating a remote MR is in
>> progress, with only those kind of special refs being writable.
>>
>> On MR acceptance the discussion/history of branch gets into the maintainer/
>> reference tree through the merge commit object and gets included
>> whenever one
>> pulls from this tree
>>
>>> Where is this git[s] are hosted?
>> Wherever the developper/maintainer wants it to be hosted
>>> What about force pushes?
>> Well a force-push as per the rule of no changing the commits of a public
>> branch
>> end-up as new reference linking to the old one for traceability.
>>> What about authorization/user identification?
>> For this one I thought of a X.509 like tree where you need to get your
>> key/identity signed
>> by some kind of AC so that you create an account through that AC and can
>> push on whatever tree
>> that trust that AC or one of its parent. I thought about a root with two
>> main branches one for
>> "Anonymous" kind of registration where you can use something like OpenId
>> to get identified
>> and get your matching certificate signed and another one for "Higher
>> trust" given to e.g Linus
>> so he can sign his maintainers and so they can also sign sub-maintainers
>> and so on. Then you can
>> set-up your repository to trust the root if you want anyone to be able
>> to push or some sub-AC to
>> restrict and maybe even a depth restriction to allow a hierarchical work
>> as done today.
>>> It would be nice to reuse git's persistent storage format and ability
>>> to push/fetch incremental changes, but we would need to figure out
>>> answers to these questions. Maybe I am missing something obvious.
>>> Could you outline how a solution based on git could look like?
>>> Also in this case git is only a transport layer (like email/SSB), it
>>> won't solve the application layer (how patches/comments/issues/CI
>>> results are described, systems that consume, act and present that,
>>> etc). So building a solid transport, even if we will need to
>>> reimplement some git functionality, will be a smaller part of the
>>> overall effort. And building a solid transport layer that will solve
>>> fundamental infrastructure problems well may be worth it.
> Thanks! This clears some of my doubts.
> However, I still don't see the complete picture:
> 1. If I setup a git on github (a new contributor), is it possible to
> setup github repo to trust an AC? I have not seen such option. I
> assume you need to be configuring you git server manually for this
> type of thing?
> 2. Restricting write access to some refs. Again, this does not seem to
> be possible with github. Is it possible with own stock server?
> 3. If the "comments" ref is writable, can user A delete user B's
> comments? Can change/repo owner delete "unwanted" comments?
> 4. git transport will also need DoS/spam protection, right? Because
> it's easy to create 1000 new users each sending 1000 new merge
> requests.
> 5. To sync my local view of the world, I need to fetch, say, net tree
> git, then from that find set of other git trees with pending merge
> requests and pull these trees, right? There may be a potential problem
> with availability: if people setup gits on github, gitlab, kernel.org,
> private hostings, etc, some of them may be down.
Well the identity/authentication part is all new (I don't know of any git
server with that ability), but feels to me like the only possibility to
ensure you don't have to create an account everywhere and you are still
identified/given permissions. Moreover if you build this into "standard" git
you can more easily expect github and co to implement it and be
interoperable.

Gitolite for example allow to give fine-grained permissions on refs so I
think it
might be possible to easily get this authorization granularity into more
git servers.

For me the comments ref should be in an append only system for everyone
but the owner
as for legal reason we must give the possibility for the repo owner to
discard comments
(he might in the worst case be held responsible for illegal content
hosted using this).
For the change part, I see I forgot to say I expected the "commits" to
be signed using
a key/certificate that can be linked to the one used for authentication.

The fourth point is needed yes whenever you allow some kind of anonymous
submission.

The fifth point is real but I don't see a way to get a PR without an
available tree to pull from.
The only other way I can think of would be even more prone to spam and
DoS as it would require PRs
to be pushed to the destination git and so you would be able to push big
objects (a ref to an external
tree is light and isn't going to be too much of a burden for the long run).

Nicolas

