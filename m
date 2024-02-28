Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E2A8145351
	for <workflows@vger.kernel.org>; Wed, 28 Feb 2024 14:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=163.172.96.212
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709131157; cv=none; b=mEZIMNfSZJbScd9K84hnsJWffL9PIPE/QO1+tdWnF/RfUvFNueCJHQvCHY09QQLaeXGkJk01Ap6Hy7YGsI/Vto3j9pX5CznMB8dr85DTefnrml6RQ5uHLnBmXk+omux0sE5Qw4ClODqqRYUANmF9DHu0Q7HzKSvATwe+i+NJjAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709131157; c=relaxed/simple;
	bh=OqDrgTW1ynxPEAMNUk+ucQIfvEAV5G0V+qRI5jtwZgA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RLjaU6LRMxXtsoDbQxKM6sgCJDTCagpE6SknulBMvH2A3QA4l5rgxSGzJoF8DKjHho2S/tfLMyezTqMZDrey3tEx7sA1HmjmTxNzSgf5TD0CkT3e83IU7NoL4SJ5IjKbv1iWFtkbTH7YUdwI239Zsj+zk4xXHZRm1IhSzxQ+5jY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; arc=none smtp.client-ip=163.172.96.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Received: (from willy@localhost)
	by mail.home.local (8.17.1/8.17.1/Submit) id 41SEd2kt025646;
	Wed, 28 Feb 2024 15:39:02 +0100
Date: Wed, 28 Feb 2024 15:39:02 +0100
From: Willy Tarreau <w@1wt.eu>
To: Mark Brown <broonie@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, users@kernel.org,
        tools@kernel.org, workflows@vger.kernel.org
Subject: Re: Toy/demo: using ChatGPT to summarize lengthy LKML threads (b4
 integration)
Message-ID: <Zd9FhtSLq4vrcWpu@1wt.eu>
References: <20240227-flawless-capybara-of-drama-e09653@lemur>
 <20240228050007.GB18047@1wt.eu>
 <701aad76-2706-4e33-b8ba-9c76282e26d1@sirena.org.uk>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <701aad76-2706-4e33-b8ba-9c76282e26d1@sirena.org.uk>

Hi Mark,

On Wed, Feb 28, 2024 at 02:03:31PM +0000, Mark Brown wrote:
> On Wed, Feb 28, 2024 at 06:00:07AM +0100, Willy Tarreau wrote:
> > On Tue, Feb 27, 2024 at 05:32:34PM -0500, Konstantin Ryabitsev wrote:
> 
> > > So, the question is -- is this useful at all? Am I wasting time poking in this
> > > direction, or is this something that would be of benefit to any of you? If the
> > > latter, I will document how to set this up and commit the thread minimization
> > > code I hacked together to make it cheaper.
> 
> > I figured a number of shortcomings about this: I suspect that those
> > most interested in such output are either, a bit like me, not much
> > active on kernel development, or focus on a specific area and mostly
> > want to stay aware of ongoing changes in other areas they're really
> > not familiar with.
> 
> I can imagine using this sort of thing for the case where I get to my
> inbox in the morning and there's some enormous thread appeared overnight
> with people arguing and I'm trying to get a handle on what the various
> subthreads are all about.

So maybe I'm not the only one expurging my mailbox during coffee time
after all :-)

> The demo didn't cover exactly that case but
> it looked like it might be able to give some sort of useful steer.

Please see below for an example of what I got locally.

> > Also regarding processing costs, I've had extremely good results using
> > the Mixtral-8x7B LLM in instruct mode running locally. It has a 32k context
> > like GPT4. And if not enough, given that most of a long thread's contents
> > is in fact quoted text, it could be sufficient to drop multiple indents
> > to preserve a response and its context while dropping most of the repeat
> > (it cuts your example thread in roughly half). But this still takes quite
> > a bit of processing time: processing the 14 mails from the thread above
> > took 13 minutes on a 80-core Ampere Altra system (no GPU involved here).
> > This roughly costs 1 minute per e-mail, that's a lot per day, not counting
> > the time needed to tune the prompt to get the best results!
> 
> That actually sounds potentially viable for my case, at least while I'm
> at home.

OK, if you're interested in giving it a try at home, here's what I've been
using:
  - github.com/ggerganov/llama.cpp 
  - the mixtral LLM from:
    https://huggingface.co/TheBloke/Mixtral-8x7B-Instruct-v0.1-GGUF/tree/main
    I'm used to Q5_K_M quantization which generally provides the best
    compromise of accuracy/performance/speed, but for e-mail summaries,
    maybe using a smaller one would give good enough results faster.
  - ~35G of available RAM for the model above and plenty of cores (80 in
    my case)

I downloaded the whole thread in mbox format from lore (message ID
20240223143833.1509961-1-guanyulin@google.com), passed it through
formail to drop useless headers that take a lot of context space
and time, and drop 2nd-level replies:

  $ (echo "<|im_start|>data"; zcat t.mbox.gz | \
    formail -I X- -I Received -I ARC- -I Authentication- -I DKIM- \
            -I List- -I Precedence -I Mime- -I Message-ID -s | \
    grep -v '^>[ ]*>'; echo "<|im_end|>") > q1.txt

The mbox roughly shrank in half (~4k words).

Then I ran the attempt below with the following command (the model
understands different prompt formats, this one works fine enough):

  $ ./main -c 0 --temp 0.3 -n -1 --threads 80 -tbd 40 \
  -m /mnt/models/mixtral-8x7b-instruct-v0.1.Q5_K_M.gguf \
  -p "<|im_start|>system
    You're an e-mail summarizaiton bot, please follow the instructions below.<|im_end|>
   <|im_start|>user
   Please summarize the conversation in the DATA section below, focusing on
   the important points, objections and decisions taken, in three to four
   paragraphs. Please do not forget to mention who thinks what, and if
   anyone agrees or objects.<|im_end|>
   " -f q1.txt

Note that you can remove the debugging pollution using --log-disable.
Also, 80 and 40 are the number of CPUs to use when parsing and responding
respectively, they're optimal on this machine but normally you just use
--threads $(nproc) and don't specify -tbd.

This time with the trimmed 2nd-level responses, it took 9m45, and
produced the following, which I found reasonably accurate based on some
visual checks I did in this thread:

| The conversation in the provided data section is centered around a patch
| submitted by Guan-Yu Lin to the Linux kernel mailing list. The patch
| introduces a new sysfs entry called "conditional_skip" that allows the
| system to selectively skip certain device power management state
| transitions. This feature is intended to address conflicts that can
| arise in systems with a main processor and a co-processor, where
| asynchronous controller management can lead to issues such as the main
| processor attempting to suspend a device while the co-processor is
| actively using it.
| 
| Andy Shevchenko raises concerns about the use of an int for the ".event"
| member in struct pm_message, suggesting that it might give subtle errors
| related to promoted signdness. Guan-Yu Lin agrees and asks if they
| should refrain from using bitwise operation here or just change the type
| to u32.
| 
| Florian Fainelli questions the use of a sysfs entry for this feature,
| suggesting that it would be more appropriate to use firmware's
| description for this purpose. Guan-Yu Lin explains that they anticipate
| that control of the peripheral will be shared between operating system
| kernels and that they need to store information about whether another
| operating system is actively using this peripheral. Florian Fainelli
| suggests unbinding and rebinding the device from its driver when it
| needs to be taken over by another operating system.
| 
| Rafael J. Wysocki expresses concerns about the idea of conditionally
| skipping system-wide power management transitions for a device,
| questioning why a device would be skipped in one transition but not
| another and expressing doubts about the overall usefulness of this
| feature. Guan-Yu Lin attempts to clarify their reasoning, but Rafael J.
| Wysocki remains unconvinced.
| 
| Overall, the conversation revolves around the design and implementation
| of a new feature for the Linux kernel that allows for more fine-grained
| control over device power management state transitions in systems with
| multiple processors or co-processors. There are concerns about the use
| of a sysfs entry for this purpose and doubts about the overall
| usefulness of the feature, but Guan-Yu Lin attempts to address these
| concerns and clarify their reasoning throughout the conversation.
| [end of text]

Not bad at all if you want my opinion, and from what I've seen, it
managed to connect questions and comments with the quoted parts. The
speed can be adjusted by trying smaller quantization (e.g. Q3) which
will use less memory bandwidth and sometimes perform more SIMD ops at
once. In addition it can be worth trying smaller models such as its
cousin Mistral-7B-v0.2 which is very good as well, but they generally
have a smaller window. It can be stretched to 32k using -c 32768 but
the quality normally degrades with larger windows. That remains to
be attempted. Some even newer 1.6-3B models exist as well and seem
to summarize well some short texts, but I don't know how it goes when
stretching their context, nor if they're at ease with mbox formats.
Their real benefit would be to run on more common hardware at
acceptable speeds.

Regards,
Willy
