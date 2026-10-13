Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D57550DA1
	for <workflows@vger.kernel.org>; Tue, 13 Oct 2026 20:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791924331; cv=none; b=BlPXETXStHlSZneQPYwkbfAIUaFaAedGpIeImQ6A9YsDExrm+3EemKIdlxnlZH7kbLkq/D3oerVmL21rEhVIY5kFbJC4TFsU3+t3o3KH45m5C0ttMRqGOIsv5c2MRpjGf+46m+tDsYGoGVmts216Zjggjg87sNkeXbWmihn9Aeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791924331; c=relaxed/simple;
	bh=yf4RMSnfEunnWk24XKCESjvLCRcSQ8/3hZrlo8LL1ZM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GMC/cm6VgN+wCZOjiC2Z3swD9GzfidpskrkoU9rQZcRhMEkVpzI/JNLWy4A/OTmj/xVMWSdwpfqpKvi/tklc59OI0ja7RLYt6HJnKmfkw9lgdT9wG1pgFLVJtHQ7d/7cQdorsE3LIW2heUPfarTnuQ0i26/StSckg/SIxwGWLoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=AlpqHr36; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="AlpqHr36"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6aa8d04fcddso7005157a12.0
        for <workflows@vger.kernel.org>; Tue, 13 Oct 2026 13:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1791924327; x=1792529127; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RudQW7LOxsA6jUYblmQYPlfgoE0oTplLFcjkSbHMtHo=;
        b=AlpqHr36Py4kkfLUK4jLycUgLteBRZQ4HKeW75BxDE9VgSTzswjtLwOD8Y/gUW3nRC
         CpCMC6jLuqUmz0o2ptZ6QHADVPd0SURsuRFzH9/U0kC1/Omn6tw30RSmu45nwKCY+NOA
         ZpEaLiowlo1A4uKcUdS9X32JIrZN4bmltyqCc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791924327; x=1792529127;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RudQW7LOxsA6jUYblmQYPlfgoE0oTplLFcjkSbHMtHo=;
        b=S0DJVgWSVF0OXXvu4cqWLV/ATH2W/aN0o5iej20hA8iMkpmdewLn7HVIp02J24OunN
         uoJMdPZrSOl0Iv2e8YSi5GpF8pX26xN48nW9S/+UFIvi3ZENGKQi8UIB96t5jmFoq7Jv
         bZxw2IXrbV/cy+iQAtZcq78LVuejjZ7tHhHFdGRTeNeS5LbVaJ+EG/x61+EbjlpR4opY
         nrgboiNOIzKZEoEQ6yioCLPRNPVjhZO8Hgi0fjbg7lLkw+9eDBCERiyZOA2Gx2RB4D0c
         +hayFeW7fbyjz5Li58yQRpnXRYklQ8F7WdifxWEWaL9IAWoZnd1ZoT2lVfAIodcSLT0J
         iU1A==
X-Forwarded-Encrypted: i=1; AKwUvBzwqVAKtVaz5aUDM3MIBXyrKq2Vko8MYrJiKfr0rxc8QpaVrQDZ8mZEaRCSqzGBOM5y6IQWQCCRtpU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIJhwk9WGh5D9CAlzLxiEUStb7DbGYYcMMuEfk4/8kmLZIN8sEU
	cwyv3cxOel6WOvE4YJGQM3oyWkXoSCaQjA6tqBsWbwpWL9NqmwtKhd26rXdf3SR6WeXJH3ot5G3
	OKmsC/Z0=
X-Gm-Gg: AYBFou23cfhBGz0UgOPc+e6RSrs686CMschzS26FFGcoMfNgk2m9sOavUBt8vU+SjJz
	0T8HZiZIEcAaDVu1nG9tSVBhZK+jM+6xG061+geWay3EVAVpEdzTbsWo4ucjpXo1OKnRwrInaPq
	oVomstRWOctUMCepHE3a8xGUvJz1YmJWxnUfZtztaWgzPG4vXKCQ+vf1BahQ1ZyLAcReB31x+c6
	X5oofBpBBsMTN7mt5Uex5Qv+zy8jxaAF6qJNuCPozXhg6TVPuit3P9As1q02WKTRr0aqH76QyWd
	HqX733uWO5v6DzZm3e8vYTOkHsQe+UZhODEXknk4c5W0WwM1xeu7X/DI5CQa9mPrlm1u+ueovZZ
	5GLXYjC3xth9CJha77vZUAsjeYtmXnyrtfy5aHHU4JwlEwFacn9habjuYswXEjhV8REJ7Ga66QS
	RcpeHAN/XVeN45ZYfsWEIcGLiEnbh+48mrJRPAwxy5PfaPDJX7jhRcaF/cX0Rca4E9niZbfAAEj
	G0kELmBvPB1T41UJXp3Fqs0wtqkItXgMpX8dTTg1CeMbn4z
X-Received: by 2002:aa7:cf16:0:b0:6a9:9a0e:e05f with SMTP id 4fb4d7f45d1cf-6b17ae26000mr7662090a12.2.1791924326711;
        Tue, 13 Oct 2026 13:45:26 -0700 (PDT)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com. [209.85.208.46])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b20383a22dsm283733a12.6.2026.10.13.13.45.26
        for <workflows@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 13:45:26 -0700 (PDT)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b1f31c63ebso1601109a12.0
        for <workflows@vger.kernel.org>; Tue, 13 Oct 2026 13:45:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz8DuoUbm5CKJId6lyDHKm/0oW/AD/uzWy9XYTwUHn4/5MMjnc8Da3j7ks1yoT4xnigGeVUiUoUdrQ=@vger.kernel.org
X-Received: by 2002:a17:907:3f12:b0:c2d:cc6b:27bd with SMTP id
 a640c23a62f3a-c31aa0096d6mr1387682466b.23.1791924325873; Tue, 13 Oct 2026
 13:45:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <asz9AeFe3CutP73z@gremlin> <20261013123132.GC4214@killaraus.ideasonboard.com>
 <as4pAEnLd4H68W4W@gremlin> <20261013131243.GM56180@killaraus.ideasonboard.com>
 <as4xMnT8a75pIw9v@gremlin> <FAD7F1E6-5FE0-47F5-8D10-40473B39A2D8@kernel.org>
 <907933931.787284.1791903485683@kpc.webmail.kpnmail.nl> <202610131000.43AB316FBC@keescook>
 <20261013174243.GC178151@killaraus.ideasonboard.com> <202610131216.C841415F01@keescook>
 <20261013201628.GO4214@killaraus.ideasonboard.com>
In-Reply-To: <20261013201628.GO4214@killaraus.ideasonboard.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 13 Oct 2026 13:45:09 -0700
X-Gmail-Original-Message-ID: <CAHk-=whTs09_ozN+e09GU68N1wPP56MUzDjrg9rnKxQUa0A_4Q@mail.gmail.com>
X-Gm-Features: AclHuK_onBbZH1In8K4ATjQxippesrsP-1df32iL1wjxMZwsoKfFWUOiqALbMNk
Message-ID: <CAHk-=whTs09_ozN+e09GU68N1wPP56MUzDjrg9rnKxQUa0A_4Q@mail.gmail.com>
Subject: Re: [PATCH] docs: remove Assisted-by references
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Kees Cook <kees@kernel.org>, Jori Koolstra <jkoolstra@xs4all.nl>, 
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Sasha Levin <sashal@kernel.org>, corbet@lwn.net, 
	skhan@linuxfoundation.org, rdunlap@infradead.org, federico.vaga@vaga.pv.it, 
	apw@canonical.com, joe@perches.com, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Justin Stitt <justinstitt@google.com>, 
	Carlos Maiolino <cem@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Brian Foster <bfoster@redhat.com>, 
	Christoph Hellwig <hch@infradead.org>, David Disseldorp <ddiss@suse.de>, Mark Brown <broonie@kernel.org>, 
	Jani Nikula <jani.nikula@intel.com>, Jens Axboe <axboe@kernel.dk>, 
	"David Hildenbrand (Arm)" <david@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
	"Christian Brauner (Amutable)" <brauner@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 13 Oct 2026 at 13:16, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> What this is about is setting our expectations, telling what we want and
> what we don't want.

No. What you are about is something entirely different. It has nothing
to do with "expectations", and it has everything to do with your
hangups.

I don't understand this whole idiotic concept of "don't use AI for X".

Here's a new rule just for you: don't use compilers for any of your
kernel submissions.

Because if you can't show that you really understand what the machine
is actually doing by writing your code in assembler, then I don't want
to see your code contribution. You clearly aren't competent if you
can't write it that way.

And btw, you had better not use an editor to write that commit message either.

Because I need you to show me that you can actually write a good
commit message without using tools that make it easy to backspace and
hide the mistakes you made while typing.

Ok?

Because otherwise those tool-assisted commits of yours clearly aren't
showing that you know what you are doing.

Do you not see how UTTERLY STUPID those kinds of rules would be?

So no. We're not going to make stupid rules that say "you can't use
tools for X".

The kind of expectations *I* have is that people do their best and I
expect people to understand what they are doing.

But that understanding has very little to do with what tools they use.

And quite honestly, in my experience, the people I respect and call
intelligent are not the ones that shy away from using new and
interesting tools.

                   Linus
