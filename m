Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5E8DC433F5
	for <workflows@archiver.kernel.org>; Fri, 12 Nov 2021 19:13:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C76F060F0F
	for <workflows@archiver.kernel.org>; Fri, 12 Nov 2021 19:13:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235376AbhKLTQD (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 12 Nov 2021 14:16:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229892AbhKLTQC (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 12 Nov 2021 14:16:02 -0500
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BD1DC061766
        for <workflows@vger.kernel.org>; Fri, 12 Nov 2021 11:13:11 -0800 (PST)
Received: by mail-qv1-xf2e.google.com with SMTP id m17so6915320qvx.8
        for <workflows@vger.kernel.org>; Fri, 12 Nov 2021 11:13:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=LyL+Pbdv8zZGy4BUorqP/dj3sFzFJ1TNAWISOrb9GRs=;
        b=UyraH+GZmWptyFOLr7XQmgVpRF+TpxM0TEKHFRZTSkmXshYILuA3xt+N6xV1RSoeVc
         xvO+LtfiaUkFI7Fc1GPE3nWfGSb0SSbYcwNBdv6CfBSHTRKBH71lVIo0X6qRsudSzpjN
         /VBqKlSfsZghDYLsnOEF6Zw+0FYtKcIoJqMbc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=LyL+Pbdv8zZGy4BUorqP/dj3sFzFJ1TNAWISOrb9GRs=;
        b=nuHHh2BbTggSSa9SWZhieS1WKTjUMqhotfXoP52kUA1IpHQB3A9le4M87WAJOyaa3P
         aTIVZDtdBhcx/H0Ymt6gW8DMbdklBZWjuhp58A+KqMA83efie0BYsNAj2/jff/o4WLhz
         SnUm9k07tOnB6+Xs+F3AFzE6Cmje2Km9qB2D7SsCXT/06ENzlojpAyOhRAkSOR3hJhlk
         ul25qlevTnBMauAw5SEpCW/d2FcTBE8cCcI3eDtq8t1+NpNk48F/iLr3lPoR2mQhOra4
         LRB6OWVgJ1NNun+6g5hP+UNqj4OUUpwBEkWDDF66AieO+8ZxWJJo00geKYCVgz/oXLap
         TwHA==
X-Gm-Message-State: AOAM532Dsgs5lxscJUYpYutyOC36oRAn4zB9vuM32Wf1F21D5zTQHeSP
        noJg2qJgpn8FDZT4kmtZoRTK7X6EJrmBWg==
X-Google-Smtp-Source: ABdhPJwjyhS/DxlytYT5QKLJG9ZoT/7fuscaUfG0PN2j43TpNM/BisZWQhQ1A48nJLCKk08y9XUb4g==
X-Received: by 2002:a05:6214:8c2:: with SMTP id da2mr16719257qvb.23.1636744390089;
        Fri, 12 Nov 2021 11:13:10 -0800 (PST)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-32-216-209-220-181.dsl.bell.ca. [216.209.220.181])
        by smtp.gmail.com with ESMTPSA id bs34sm3093455qkb.97.2021.11.12.11.13.09
        for <workflows@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 11:13:09 -0800 (PST)
Date:   Fri, 12 Nov 2021 14:13:08 -0500
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     workflows@vger.kernel.org
Subject: lore+lei: part 2, now with IMAP
Message-ID: <lorelei.part2.202111121411.sznnvkvcywfbdghl@meerkat.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Hello:

Continuing on my previous email about setting up lei with lore.kernel.org,
here's the next installment. As with the previous part, this will be posted on
people.kernel.org as well as here.

# lore+lei: part 2, now with IMAP

This is the second installment in the series where we're looking at using the
public-inbox `lei` tool for interacting with remote mailing list archives such
as lore.kernel.org. In the previous article we looked at delivering your
search results locally, and today let's look at doing the same, but with
remote IMAP folders.

For our example query today, we'll do some stargazing. The following will show
us all mail sent by Linus Torvalds:

    f:torvalds AND rt:1.month.ago..

I'm mostly using it because it's short, but you may want to use something
similar if you have co-maintainer duties and want to automatically receive a
copy of all mail sent by your fellow subsystem maintainers.

## Note on saving credentials

When accessing IMAP folders, `lei` will require a username and password.
Unless you really like typing them in manually every time you run `lei up`,
you will probably want to have them cached on your local system. `Lei` will
defer to `git-credential-helper` for this purpose, so if you haven't already
set this up, you will want to do that now.

The two commonly used credential storage backends on Linux are "libsecret" and
"store":

- *libsecret* is the preferred mechanism, as it will work with your Desktop
  Environment's keyring manager to store the credentials in a relatively safe
  fashion (encrypted at rest).

- *store* should only be used if you don't have any other option, as it will
  record the credentials without any kind of encryption in the
  `~/.git-credentials` file. However, if nothing else is working for you and
  you are fairly confident in the security of your system, it's something you
  can use.

Simply run the following command to configure the credential helper globally
for your environment:

    git config --global credential.helper libsecret

For more in-depth information about this topic, see `man git-credential`.

## Getting your IMAP server ready

Before you start, you should get some information about your IMAP server, such
as your login information. For my examples, I'm going to use Gmail, Migadu,
and a generic Dovecot IMAP server installation, which should hopefully cover
enough ground to be useful for the vast majority of cases.

What you will need beforehand:

- the IMAP server hostname (and port, if it's not 993)
- the IMAP username
- the IMAP password

It will also help to know the folder hierarchy. Some IMAP servers create all
subfolders below INBOX, while others don't really care.

### Generic Dovecot

We happen to be running Dovecot on mail.codeaurora.org, so I'm going to use it
as my "generic Dovecot" system and run the following command:

    lei q -I https://lore.kernel.org/all/ -d mid \
      -o imaps://mail.codeaurora.org/INBOX/torvalds \
      <<< 'f:torvalds AND rt:1.month.ago..'

The `<<<` bit above is a Bash-ism, so if you're using a different shell, you
can use the POSIX-compliant heredoc format instead:

    lei q -I https://lore.kernel.org/all/ -d mid \
      -o imaps://mail.codeaurora.org/INBOX/torvalds <<EOF
    f:torvalds AND rt:1.month.ago..
    EOF

The first time you run it, you should get a `username:` and `password:`
prompt, but after that the credentials should be cached and no longer required
on each repeated access to the same imaps server.

NOTE: some IMAP servers use the dot `.` instead of the slash `/` for
indicating folder hierarchy, so if `INBOX/torvalds` is not working for you,
try `INBOX.torvalds` instead.

### Refreshing and subscribing to IMAP folders

If the above command succeeded, then you should be able to view the IMAP
folder in your mail client. If you cannot see `torvalds` in your list of
available folders, then you may need to refresh and/or subscribe to the newly
created folder. The process will be different for every mail client, but it
shouldn't be too hard to find.

### The same with Migadu

If you have a linux.dev account (see https://korg.docs.kernel.org/linuxdev.html),
then you probably already know that we ask you not to use your account for
subscribing to busy mailing lists. This is due to Migadu imposing soft limits
on how much incoming email is allowed for each hosted domain -- so using `lei`
+ IMAP is an excellent alternative.

To set this up with your linux.dev account (or any other account hosted on
Migadu), use the following command:

    lei q -I https://lore.kernel.org/all/ -d mid \
      -o imaps://imap.migadu.com/lei/torvalds \
      <<< 'f:torvalds AND rt:1.month.ago..'

Again, you will need to subscribe to the new `lei/torvalds` folder to see it
in your mail client.

### The same with Gmail

If you are a Gmail user and aren't already using IMAP, then you will need to
jump through a few additional hoops before you are able to get going. Google
is attempting to enhance the security of your account by restricting how much
can be done with just your Google username and password, so services like IMAP
are not available without setting up a special "app password" that can only be
used for mail access.

Enabling app passwords requires that you first enable 2-factor authentication,
and then generate a random app password to use with IMAP. Please follow the
process described in the following Google document:
https://support.google.com/mail/answer/185833

Once you have the app password for use with IMAP, you can use `lei` and imaps
just like with any other IMAP server:

    lei q -I https://lore.kernel.org/all/ -d mid \
      -o imaps://imap.gmail.com/lei/torvalds \
      <<< 'f:torvalds AND rt:1.month.ago..'

It requires a browser page reload for the folder to show up in your Gmail web
UI.

## Automating lei up runs

If you're setting up IMAP access, then you probably want IMAP updates to
happen behind the scenes without your direct involvement. All you need to do
is periodically run `lei up --all` (plus `-q` if you don't want non-critical
output).

If you're just getting started, then you can set up a simple `screen` session
with a `watch` command at a 10-minute interval, like so:

    watch -n 600 lei up --all

You can then detach from the screen terminal and let that command continue
behind the scenes. The main problem with this approach is that it won't
survive a system reboot, so if everything is working well and you want to make
the command a bit more permanent, you can set up a systemd user timer.

Here's the service file to put in `~/.config/systemd/user/lei-up-all.service`:

    [Unit]
    Description=lei up --all service
    ConditionPathExists=%h/.local/share/lei

    [Service]
    Type=oneshot
    ExecStart=/usr/bin/lei up --all -q

    [Install]
    WantedBy=mail.target

And the timer file to put in `~/.config/systemd/user/lei-up-all.timer`:

    [Unit]
    Description=lei up --all timer
    ConditionPathExists=%h/.local/share/lei

    [Timer]
    OnUnitInactiveSec=10m

    [Install]
    WantedBy=default.target

Enable the timer:

    systemctl --user enable --now lei-up-all.timer

You can use `journalctl -xn` to view the latest journal messages and make sure
that the timer is running well.

CAUTION: user timers only run when the user is logged in. This is not actually
that bad, as your keyring is not going to be unlocked unless you are logged
into the desktop session. If you want to run `lei up` as a background process
on some server, you should set up a system-level timer and use a different
git-credential mechanism (e.g. `store`) -- and you probably shouldn't do this
on a shared system where you have to worry about your account credentials
being stolen.

## Coming up next

In the next installment we'll look at some other part of lei and
public-inbox... I haven't yet decided which. :)

Best regards,
-K
