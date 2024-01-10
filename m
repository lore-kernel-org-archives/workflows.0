Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA83C4D127
	for <workflows@vger.kernel.org>; Wed, 10 Jan 2024 17:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="huL+qJVT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 884B1C43390
	for <workflows@vger.kernel.org>; Wed, 10 Jan 2024 17:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704908880;
	bh=a367KTGC5vndiRZQoroC2OLhUe9GbJFSQciSuCfRC9U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=huL+qJVT5ZQPkqSNgeA1LdDCLoqh4gLmZVcwtXr+Ra/VdlZIsAVmh9f2oXm7d0l6W
	 ADrhZYYoscmIVmtzMr4bwJmTSDHbSQMihBwUbc+USdZ5AlmBYOhCA7n8AhDzkoPcK6
	 5isUGTKbNOvwr3+eFlai7CEPBSLDkAV7IkzbgfW0hckgUx0Yqsl3OADhOc/tHJuZwF
	 Xfz6mO9oejLjYodqDLAb4vLEl5Jo3hRUOSNdAUbggJsTm9G/CwhMylmHef9I4Qcc0K
	 2no9SG8QTQk15+pavcjI38CtRQ8KNulnzVfEJhp83HTTRZd4ruxG4JKlLEmBQ84wB5
	 678Qpe/mJBMCw==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2cd1232a2c7so52549411fa.0
        for <workflows@vger.kernel.org>; Wed, 10 Jan 2024 09:48:00 -0800 (PST)
X-Gm-Message-State: AOJu0YxUU1dVmpvlQVm9jpb7WgzZ2Mg5qam23PPg1dCcr5GJLKNRKzrV
	ZZsiLR285Z1NYBqi4c5i7Y7LUjpktgFvEq/yaA==
X-Google-Smtp-Source: AGHT+IEU8FBsiT/8Ba0WahNhKIAWV5vmd+bDDzH3Ry7zNMNkGoIZ6nBOHNbBIYX41kPTSHqEOPmIzgH+PDy9sibooqc=
X-Received: by 2002:a2e:9798:0:b0:2cd:122e:4424 with SMTP id
 y24-20020a2e9798000000b002cd122e4424mr762705lji.17.1704908878720; Wed, 10 Jan
 2024 09:47:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240109-alluring-fanatic-manul-cfa5d2@lemur>
In-Reply-To: <20240109-alluring-fanatic-manul-cfa5d2@lemur>
From: Rob Herring <robh@kernel.org>
Date: Wed, 10 Jan 2024 11:47:46 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKpxM36=cByzWzv-_peqG5EYzByk+SSJv-c=4iFRQxcrw@mail.gmail.com>
Message-ID: <CAL_JsqKpxM36=cByzWzv-_peqG5EYzByk+SSJv-c=4iFRQxcrw@mail.gmail.com>
Subject: Re: PSA: nullmailer should be avoided
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 9, 2024 at 3:47=E2=80=AFPM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> Hi, all:
>
> I know some of you use nullmailer for sending outgoing mail, but it *real=
ly*
> must be avoided, as the messages it sends are not RFC-2822 compliant. Per=
 that
> RFC, header lines MUST NOT be longer than 998 characters in length, which=
 is
> not something nullmailer appears to be paying any attention to.
>
> Some mailservers will outright reject messages with lines exceeding 998
> characters (Exim), and some will force-insert <CR><LF><SPACE> at exactly
> character 998, regardless of what that does to the header:
>
> https://lore.kernel.org/linux-kernel/20240109171807.GA2783042-robh@kernel=
.org/raw
>
> You will notice, that the enforced line-break cuts across the email addre=
ss:
>
>        Cc: [...] Sergey Shtylyov <s.shtyl
>         yov@omp.ru>
>
> A message with such header *may* get delivered, or it may get rejected du=
e to
> malformed headers (e.g. Exim does that by default). Anyone then attemptin=
g to
> reply to such message will likely have trouble as well.
>
> Unfortunately, nullmailer appears to always re-parse To/Cc headers, so ev=
en if
> the original email properly wrapped the recipients headers before it was =
fed
> to nullmailer, everything will then just be concatenated into one long li=
ne:
>
> https://github.com/bruceg/nullmailer/blob/master/src/inject.cc#L384

FWIW, I hacked up this fix. I'd really prefer that it not reformat
lines at all or wrap at 72 chars, but this was the easiest fix.
(Obviously, I'm not using it either ATM)

diff --git a/lib/address.cc b/lib/address.cc
index 43fae44cf331..4db63404f6fc 100644
--- a/lib/address.cc
+++ b/lib/address.cc
@@ -585,7 +585,7 @@ RULE(mailboxes)
     result r2 =3D match_mailbox(node);
     if(!r2) break;
     r1.next =3D r2.next;
-    r1.str =3D r1.str + ", " + r2.str + r2.comment;
+    r1.str =3D r1.str + ",\n " + r2.str + r2.comment;
     r1.addr +=3D r2.addr;
   }
   node =3D skipcomment(node, r1.str);
@@ -638,7 +638,7 @@ RULE(addresses)
     result r2 =3D match_address(node);
     if(!r2) break;
     r1.next =3D r2.next;
-    r1.str =3D r1.str + ", " + r2.str + r2.comment;
+    r1.str =3D r1.str + ",\n " + r2.str + r2.comment;
     r1.addr +=3D r2.addr;
   }
   node =3D skipcomment(node, r1.str);
diff --git a/src/inject.cc b/src/inject.cc
index 0a555b212fb9..851a1fda5f17 100644
--- a/src/inject.cc
+++ b/src/inject.cc
@@ -381,7 +381,7 @@ mystring make_recipient_list()
   bool first =3D true;
   for(slist::iter iter(recipients); iter; iter++) {
     if(!first)
-      result =3D result + ", " + *iter;
+      result =3D result + ",\n " + *iter;
     else
       result =3D *iter;
     first =3D false;
>
> I'll open an issue with nullmailer about this, but the project doesn't ap=
pear
> very alive, so your best bet is to switch to msmtp. It has
> msmtp-{enqueue,listqueue,runqueue} commands that will do everything nullm=
ailer
> can do and won't break your mail.

My issue was the queuing is not part of msmtp, but add-on scripts of
unknown robustness and maintenance.

Rob
